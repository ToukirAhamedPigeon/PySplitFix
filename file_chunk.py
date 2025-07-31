import os
import re
from pathlib import Path

input_file = 'sqls/building_database.sql'
output_dir = 'chunks'
chunk_count = 10

# Step 1: Read file and extract full table blocks
with open(input_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Each block: list of lines
table_blocks = []
current_block = []
inside_table = False

for line in lines:
    lower = line.strip().lower()

    if lower.startswith('create table'):
        if current_block:
            table_blocks.append(current_block)
        current_block = [line]
        inside_table = True

    elif inside_table:
        current_block.append(line)
        if line.strip().endswith(");"):
            inside_table = False

    elif lower.startswith("insert into") and current_block:
        current_block.append(line)
        inside_table = False  # not needed but keeps state clear

    elif line.strip().startswith('(') and current_block:
        current_block.append(line)

    else:
        if current_block:
            table_blocks.append(current_block)
            current_block = []
        # Save standalone non-table lines as their own block
        if line.strip():
            table_blocks.append([line])

# Append last block if pending
if current_block:
    table_blocks.append(current_block)

# Step 2: Divide into N chunks
def divide_blocks(blocks, n):
    avg = len(blocks) // n
    chunks = [[] for _ in range(n)]
    for i, block in enumerate(blocks):
        chunks[i % n].extend(block)
        chunks[i % n].append('\n')  # add spacing
    return chunks

chunks = divide_blocks(table_blocks, chunk_count)

# Step 3: Write chunks to separate files
Path(output_dir).mkdir(parents=True, exist_ok=True)
base_name = Path(input_file).stem

for i, chunk in enumerate(chunks, start=1):
    chunk_path = os.path.join(output_dir, f"{base_name}_{i}.sql")
    with open(chunk_path, 'w', encoding='utf-8') as f:
        f.writelines(chunk)

print(f"✅ Split completed: {chunk_count} files saved to `{output_dir}/`")
