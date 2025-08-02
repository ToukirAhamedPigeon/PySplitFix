"""
This script separates a large SQL dump into:
1. A single file containing all CREATE statements (TABLE/VIEW/etc.) → filename_0.sql
2. A JSON file with nullable non-text column indexes for each TABLE → filename_indexes.json
3. A single file with only INSERT INTO statements (excluding v_construction_installment) → filename_temp.sql

This helps cleanly import schema and data separately, and prepares for cleaning invalid values during refinement.
"""

import os
import re
import json
from pathlib import Path

# --- Configuration ---
input_file = 'sqls/building_database.sql'
output_dir = 'chunks'
chunk_count = 10  # No longer used for insert splitting
base_name = Path(input_file).stem

create_file = os.path.join(output_dir, f"{base_name}_0.sql")
insert_temp_file = os.path.join(output_dir, f"{base_name}_temp.sql")
json_index_file = os.path.join(output_dir, f"{base_name}_indexes.json")

Path(output_dir).mkdir(parents=True, exist_ok=True)

# --- Step 1: Extract CREATE statements (TABLE/VIEW/etc.) and track nullable non-text columns ---
nullable_column_map = {}
inside_create = False
create_block = []
current_table = None
column_index = 0

with open(input_file, 'r', encoding='utf-8') as fin, open(create_file, 'w', encoding='utf-8') as fcreate:
    for line in fin:
        stripped = line.strip()

        if stripped.lower().startswith("create table"):
            inside_create = True
            create_block = [line]
            column_index = 0

            table_match = re.search(r"create\s+(table)\s+[`\"]?(\w+)[`\"]?", stripped, re.IGNORECASE)
            if table_match:
                obj_type = table_match.group(1).lower()
                obj_name = table_match.group(2)

                if obj_name == 'v_construction_installment':
                    # Skip entire view block
                    while not stripped.endswith(';'):
                        line = next(fin)
                        stripped = line.strip()
                    inside_create = False
                    continue

                if obj_type == 'table':
                    current_table = obj_name
                    nullable_column_map[current_table] = []

            continue

        if inside_create:
            create_block.append(line)

            if current_table:
                col_def = line.strip().rstrip(',').lower()
                if col_def and not col_def.startswith(('primary', 'unique', 'key')) and '`' in col_def:
                    col_parts = col_def.split()
                    if len(col_parts) >= 2:
                        dtype = col_parts[1]
                        is_nullable = 'default null' in col_def
                        if (
                            not dtype.startswith('varchar') and
                            not dtype.startswith('text') and
                            not dtype.startswith('char') and
                            is_nullable
                        ):
                            nullable_column_map[current_table].append(column_index)
                        column_index += 1

            if stripped.endswith(';'):
                fcreate.writelines(create_block)
                fcreate.write("\n")
                inside_create = False
                current_table = None

# Save nullable index map
with open(json_index_file, 'w', encoding='utf-8') as fjson:
    json.dump(nullable_column_map, fjson, indent=2)

# --- Step 2: Extract INSERT INTO statements (excluding any related to v_construction_installment) ---
with open(input_file, 'r', encoding='utf-8') as fin, open(insert_temp_file, 'w', encoding='utf-8') as fout:
    inside_insert = False
    insert_block = []

    for line in fin:
        stripped = line.strip()

        if stripped.lower().startswith("insert into"):
            if 'v_construction_installment' in stripped.lower():
                inside_insert = True  # skip this block
                continue
            inside_insert = True
            insert_block = [line]
            continue

        if inside_insert:
            insert_block.append(line)

        if inside_insert and stripped.endswith(';'):
            if insert_block and 'v_construction_installment' not in insert_block[0].lower():
                fout.writelines(insert_block)
                fout.write('\n')
            inside_insert = False

# --- Done ---
print("✅ Done!")
print(f"  • CREATE statements → {create_file}")
print(f"  • Nullable indexes → {json_index_file}")
print(f"  • INSERTs → {insert_temp_file}")
