"""
This script processes a filtered SQL file that contains only INSERT INTO statements
and replaces any invalid empty strings ('' or "") with NULL — only for the column
indexes provided in a JSON file (auto-generated from CREATE TABLE analysis).

Handles:
- INSERT INTO statements that span multiple lines.
- Value rows that may include newlines within string columns.
"""

import os
import json
import re

# --- Configuration ---
input_file = 'chunks/building_database_temp.sql'  # Modify per file
output_file = 'chunks/building_database_temp_refined.sql'  # Overwrite in-place
json_index_file = 'chunks/building_database_indexes.json'

# --- Load nullable non-text indexes per table ---
with open(json_index_file, 'r', encoding='utf-8') as f:
    nullable_index_map = json.load(f)


def fix_row(row_line: str, null_column_indexes: list[int]) -> str:
    """
    Replace '' or "" with NULL in a value row at specified column positions.
    Works even if the row ends with ');' instead of '),'.
    """
    row = row_line.strip()
    if not row.startswith('('):
        return row_line

    ends_with_comma = row.endswith(',')  # whether the row ends with ","
    ends_with_semicolon = row.endswith(');')

    if ends_with_comma:
        row = row[:-1]
    elif ends_with_semicolon:
        row = row[:-2]

    # Now row is (val1, val2, ..., valN)
    row = row.strip()
    if row.startswith('('):
        row = row[1:]
    if row.endswith(')'):
        row = row[:-1]

    parts = []
    current = ''
    in_quotes = False
    escape = False
    quote_char = ''

    # Properly parse values, respecting quotes and escaped characters
    for char in row:
        if escape:
            current += char
            escape = False
        elif char == '\\':
            current += char
            escape = True
        elif char in ["'", '"']:
            current += char
            if not in_quotes:
                in_quotes = True
                quote_char = char
            elif char == quote_char:
                in_quotes = False
        elif char == ',' and not in_quotes:
            parts.append(current.strip())
            current = ''
        else:
            current += char
    parts.append(current.strip())  # Add last part

    # Replace empty strings with NULL
    for i in null_column_indexes:
        if i < len(parts) and parts[i] in ["''", '""']:
            parts[i] = 'NULL'

    # Reassemble
    fixed_row = '(' + ', '.join(parts)
    fixed_row += '),' if ends_with_comma else ');'
    return fixed_row + '\n'


# --- Main Processing ---
with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8') as outfile:
    current_table = None
    current_indexes = []

    accumulating_row = False
    row_buffer = []

    for line in infile:
        stripped = line.strip().lower()

        if stripped.startswith('insert into'):
            match = re.match(r'insert into [`"]?(\w+)[`"]?\s+values', stripped)
            if match:
                current_table = match.group(1)
                current_indexes = nullable_index_map.get(current_table, [])
            outfile.write(line)
        elif line.strip().startswith('(') or accumulating_row:
            row_buffer.append(line)
            accumulating_row = True

            if line.strip().endswith('),') or line.strip().endswith(');'):
                full_row = ''.join(row_buffer)
                fixed = fix_row(full_row, current_indexes)
                outfile.write(fixed)
                row_buffer = []
                accumulating_row = False
        else:
            outfile.write(line)

print(f"✅ Cleaned {input_file} using {json_index_file}")
