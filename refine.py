# import re
#
# input_file = 'sqls/tbl_building_info_view.sql'
# output_file = input_file
#
# def get_nullable_non_text_column_indexes(create_sql: str):
#     """Extract column indexes where DEFAULT NULL and type NOT varchar/text."""
#     lines = create_sql.splitlines()
#     column_defs = []
#     collecting = False
#
#     for line in lines:
#         line = line.strip()
#         if line.lower().startswith("create table"):
#             collecting = True
#         elif collecting and line.startswith("`"):
#             column_defs.append(line)
#         elif collecting and line.startswith(")") and "engine=" in line.lower():
#             break
#
#     indexes = []
#     for idx, col in enumerate(column_defs):
#         parts = re.split(r'\s+', col, maxsplit=3)
#         if len(parts) < 3:
#             continue
#         col_type = parts[1].lower()
#         col_def = ' '.join(parts[2:]).lower()
#
#         if any(t in col_type for t in ['varchar', 'text']):
#             continue
#         if 'default null' in col_def:
#             indexes.append(idx)
#
#     return indexes
#
#
# def fix_row(row_line: str, null_column_indexes) -> str:
#     """Fix a single value row, replacing '' or "" with NULL at target indexes"""
#     row = row_line.strip()
#     if not row.startswith('('):
#         return row_line
#
#     ends_with_comma = row.endswith(',')
#     if ends_with_comma:
#         row = row[:-1]
#
#     parts = []
#     current = ''
#     in_quotes = False
#     quote_char = ''
#
#     for char in row[1:-1]:  # remove surrounding parentheses
#         if char in ['"', "'"]:
#             if not in_quotes:
#                 in_quotes = True
#                 quote_char = char
#             elif in_quotes and char == quote_char:
#                 in_quotes = False
#         if char == ',' and not in_quotes:
#             parts.append(current.strip())
#             current = ''
#         else:
#             current += char
#     parts.append(current.strip())
#
#     for i in null_column_indexes:
#         if i < len(parts) and parts[i] in ["''", '""']:
#             parts[i] = 'NULL'
#
#     if ends_with_comma:
#         fixed_row = '(' + ', '.join(parts) + '),'
#     else:
#         fixed_row = '(' + ', '.join(parts) + ';'
#
#     return fixed_row + '\n'
#
#
# # Process file
# with open(input_file, 'r', encoding='utf-8') as infile:
#     lines = infile.readlines()
#
# create_sql = ""
# capture = False
# for line in lines:
#     if line.strip().lower().startswith("create table"):
#         capture = True
#     if capture:
#         create_sql += line
#         if line.strip().endswith(");"):
#             break
#
# # Auto-extract column indexes
# null_column_indexes = get_nullable_non_text_column_indexes(create_sql)
#
# # Rewrite SQL dump
# with open(output_file, 'w', encoding='utf-8') as outfile:
#     inside_insert_block = False
#
#     for line in lines:
#         if line.strip().lower().startswith("insert into"):
#             inside_insert_block = True
#             outfile.write(line)
#         elif inside_insert_block and line.strip().startswith('('):
#             fixed = fix_row(line, null_column_indexes)
#             outfile.write(fixed)
#         else:
#             inside_insert_block = False
#             outfile.write(line)



import re

input_file = 'chunks/building_database_5.sql'
output_file = input_file


def get_nullable_non_text_column_indexes(create_sql: str) -> list[int]:
    lines = create_sql.splitlines()
    column_defs = []
    collecting = False

    for line in lines:
        line = line.strip()
        if line.lower().startswith("create table"):
            collecting = True
        elif collecting and line.startswith("`"):
            column_defs.append(line)
        elif collecting and line.startswith(")") and "engine=" in line.lower():
            break

    indexes = []
    for idx, col in enumerate(column_defs):
        parts = re.split(r'\s+', col, maxsplit=3)
        if len(parts) < 3:
            continue
        col_type = parts[1].lower()
        col_def = ' '.join(parts[2:]).lower()

        if any(t in col_type for t in ['varchar', 'text']):
            continue
        if 'default null' in col_def:
            indexes.append(idx)

    return indexes


def fix_row(row_line: str, null_column_indexes: list[int]) -> str:
    row = row_line.strip()
    if not row.startswith('('):
        return row_line

    ends_with_comma = row.endswith(',')
    if ends_with_comma:
        row = row[:-1]

    parts = []
    current = ''
    in_quotes = False
    quote_char = ''

    for char in row[1:-1]:
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
    parts.append(current.strip())

    for i in null_column_indexes:
        if i < len(parts) and parts[i] in ["''", '""']:
            parts[i] = 'NULL'

    if ends_with_comma:
        fixed_row = '(' + ', '.join(parts) + '),'
    else:
        fixed_row = '(' + ', '.join(parts) + ';'

    return fixed_row + '\n'


with open(input_file, 'r', encoding='utf-8') as infile:
    lines = infile.readlines()

with open(output_file, 'w', encoding='utf-8') as outfile:
    current_create_sql = ""
    current_null_indexes = []
    processing_create = False
    processing_insert = False

    for line in lines:
        stripped = line.strip().lower()

        # New CREATE TABLE
        if stripped.startswith("create table"):
            processing_create = True
            current_create_sql = line
            outfile.write(line)
            continue

        if processing_create:
            current_create_sql += line
            outfile.write(line)
            if stripped.endswith(");"):
                # Done with CREATE TABLE
                current_null_indexes = get_nullable_non_text_column_indexes(current_create_sql)
                processing_create = False
            continue

        # INSERT INTO
        if stripped.startswith("insert into"):
            processing_insert = True
            outfile.write(line)
            continue

        if processing_insert:
            if line.strip().startswith('('):
                fixed = fix_row(line, current_null_indexes)
                outfile.write(fixed)
                continue
            else:
                processing_insert = False  # End of INSERT block

        outfile.write(line)
