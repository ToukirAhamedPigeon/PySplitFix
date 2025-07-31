"""
This script splits a large SQL file containing multiple `CREATE TABLE` and `INSERT INTO` statements
into multiple smaller SQL files ("chunks"). It ensures that all statements related to a specific table
(e.g., CREATE TABLE and associated INSERTs) remain within the same output file.

Purpose:
- Useful when importing large SQL files that are too big or error-prone to execute in one go.
- Preserves table integrity by grouping all statements related to each table together.
- Ensures better manageability and troubleshooting during manual SQL execution.
"""

import os                     # For file path operations
import re                     # For regex operations (not used here but often useful in SQL parsing)
from pathlib import Path      # For cross-platform path handling

# Input SQL file path
input_file = 'sqls/building_database.sql'

# Output directory for chunks
output_dir = 'chunks'

# Number of chunks to divide the SQL file into
chunk_count = 10

# Step 1: Read the SQL file line by line
with open(input_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Holds all grouped table-related SQL blocks (CREATE + INSERTs)
table_blocks = []

# Temporarily holds the current block being constructed
current_block = []

# Tracks whether we're inside a CREATE TABLE definition
inside_table = False

# Iterate through each line in the SQL file
for line in lines:
    lower = line.strip().lower()

    # If we encounter a CREATE TABLE statement
    if lower.startswith('create table'):
        if current_block:
            # Save any previous block before starting a new one
            table_blocks.append(current_block)
        current_block = [line]
        inside_table = True

    # If inside CREATE TABLE definition, append lines until it ends with ');'
    elif inside_table:
        current_block.append(line)
        if line.strip().endswith(");"):
            inside_table = False  # End of table definition

    # If it's an INSERT INTO line, append to current block
    elif lower.startswith("insert into") and current_block:
        current_block.append(line)
        inside_table = False

    # If it's a continuation of an INSERT VALUES line (e.g., starts with '(')
    elif line.strip().startswith('(') and current_block:
        current_block.append(line)

    else:
        # If we hit an unrelated line, save the current block
        if current_block:
            table_blocks.append(current_block)
            current_block = []
        # Save non-empty unrelated lines as their own block
        if line.strip():
            table_blocks.append([line])

# If the last block wasn't added yet, add it now
if current_block:
    table_blocks.append(current_block)

# Step 2: Divide all blocks into `chunk_count` groups
def divide_blocks(blocks, n):
    avg = len(blocks) // n  # average block count per chunk
    chunks = [[] for _ in range(n)]  # Initialize empty chunks

    # Distribute blocks round-robin into chunks
    for i, block in enumerate(blocks):
        chunks[i % n].extend(block)     # Add block to corresponding chunk
        chunks[i % n].append('\n')      # Add a newline for separation

    return chunks

# Generate the chunks
chunks = divide_blocks(table_blocks, chunk_count)

# Step 3: Write each chunk to a separate file
Path(output_dir).mkdir(parents=True, exist_ok=True)  # Ensure output directory exists

# Base name of the input file, without extension (e.g., 'building_database')
base_name = Path(input_file).stem

# Write each chunk to a separate file
for i, chunk in enumerate(chunks, start=1):
    chunk_path = os.path.join(output_dir, f"{base_name}_{i}.sql")
    with open(chunk_path, 'w', encoding='utf-8') as f:
        f.writelines(chunk)

# Final success message
print(f"Split completed: {chunk_count} files saved to `{output_dir}/`")
