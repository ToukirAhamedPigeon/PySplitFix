"""
Script Purpose:
---------------
This script processes a SQL dump file and replaces invalid empty string values (`''` or `""`)
with `NULL` only for columns that:
    1. Are not of type VARCHAR or TEXT
    2. Explicitly allow NULL (i.e., have `DEFAULT NULL` in the schema)

It reads the SQL file containing multiple `CREATE TABLE` and `INSERT INTO` statements, determines
the correct columns where NULLs are valid, and rewrites the insert value rows accordingly.

Usage:
------
- Update the `input_file` and `output_file` paths as needed.
- Run the script to fix the file in-place or write a corrected version.

Limitations:
------------
- This works on SQL dumps where inserts are line-by-line (each value row in its own line).
- It assumes MySQL-compatible syntax.
"""

import re  # Regular expressions for parsing SQL lines

input_file = 'chunks/building_database_5.sql'  # Input SQL file path
output_file = input_file  # Output file (overwrite input or set to new file)


def get_nullable_non_text_column_indexes(create_sql: str) -> list[int]:
    """
    Extract column indexes where DEFAULT NULL is allowed and type is NOT VARCHAR or TEXT.
    These are the indexes eligible for replacing '' or "" with NULL in insert statements.
    """
    lines = create_sql.splitlines()  # Split the CREATE TABLE SQL into lines
    column_defs = []  # Store lines defining each column
    collecting = False  # Flag to know if we're inside a CREATE TABLE block

    for line in lines:
        line = line.strip()
        if line.lower().startswith("create table"):
            collecting = True
        elif collecting and line.startswith("`"):  # Column definition
            column_defs.append(line)
        elif collecting and line.startswith(")") and "engine=" in line.lower():  # End of CREATE
            break

    indexes = []  # Column indexes where NULL is allowed and not a text type

    for idx, col in enumerate(column_defs):
        parts = re.split(r'\s+', col, maxsplit=3)  # Split into parts: name, type, rest
        if len(parts) < 3:
            continue

        col_type = parts[1].lower()  # Get data type (e.g., INT, DATE)
        col_def = ' '.join(parts[2:]).lower()  # Rest of column definition

        if any(t in col_type for t in ['varchar', 'text']):
            continue  # Skip string/text types

        if 'default null' in col_def:
            indexes.append(idx)  # Keep track of index if it's nullable and not string

    return indexes


def fix_row(row_line: str, null_column_indexes: list[int]) -> str:
    """
    Given a single INSERT value row, replace '' or "" with NULL for specified column indexes.
    """
    row = row_line.strip()

    if not row.startswith('('):  # Not a value line
        return row_line

    ends_with_comma = row.endswith(',')  # Check if row ends with comma (more to come)
    if ends_with_comma:
        row = row[:-1]  # Remove trailing comma

    # Split row into individual values, taking care of quoted strings
    parts = []
    current = ''
    in_quotes = False
    quote_char = ''

    for char in row[1:-1]:  # Remove parentheses before parsing
        if char in ['"', "'"]:
            if not in_quotes:
                in_quotes = True
                quote_char = char
            elif in_quotes and char == quote_char:
                in_quotes = False

        if char == ',' and not in_quotes:
            parts.append(current.strip())
            current = ''
        else:
            current += char
    parts.append(current.strip())  # Add the last field

    # Replace empty strings with NULL for target indexes
    for i in null_column_indexes:
        if i < len(parts) and parts[i] in ["''", '""']:
            parts[i] = 'NULL'

    # Reconstruct the row with fixed values
    if ends_with_comma:
        fixed_row = '(' + ', '.join(parts) + '),'
    else:
        fixed_row = '(' + ', '.join(parts) + ';'

    return fixed_row + '\n'  # Add newline


# Begin processing file
with open(input_file, 'r', encoding='utf-8') as infile:
    lines = infile.readlines()  # Read all lines from file

with open(output_file, 'w', encoding='utf-8') as outfile:
    current_create_sql = ""  # Will store CREATE TABLE SQL temporarily
    current_null_indexes = []  # Indexes where '' should be replaced with NULL
    processing_create = False  # Are we inside CREATE TABLE?
    processing_insert = False  # Are we inside INSERT INTO?

    for line in lines:
        stripped = line.strip().lower()

        # Start of a CREATE TABLE block
        if stripped.startswith("create table"):
            processing_create = True
            current_create_sql = line
            outfile.write(line)
            continue

        if processing_create:
            current_create_sql += line
            outfile.write(line)
            if stripped.endswith(");"):
                # End of CREATE TABLE block — extract nullable indexes
                current_null_indexes = get_nullable_non_text_column_indexes(current_create_sql)
                processing_create = False
            continue

        # Start of an INSERT INTO block
        if stripped.startswith("insert into"):
            processing_insert = True
            outfile.write(line)
            continue

        if processing_insert:
            if line.strip().startswith('('):
                # Fix and write insert value row
                fixed = fix_row(line, current_null_indexes)
                outfile.write(fixed)
                continue
            else:
                # INSERT block ends if the line doesn't start with '('
                processing_insert = False

        # Write any non-handled line directly
        outfile.write(line)
