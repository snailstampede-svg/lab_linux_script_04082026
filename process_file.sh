#!/bin/bash

## What is the technical term for the code on Line 1

# Answer: The technical term for the code on Line 1 is "shebang" or "hashbang" as it is a combination 
# of the hash character (#) and the exclamation mark sometimes refered to as  (!). 

## What does it accomplish

# It indicates the interpreter that should be used to execute the script. 
# In this case, it specifies that the script should be run using the Bash shell located at /bin/bash.

################################################################################################################

INPUT_FILE="input/test.txt"
INPUT_FILE_1="input/test_1.txt"
OUTPUT_DIR="output"
OUTPUT_FILE="output/processed.txt"

mkdir -p "$OUTPUT_DIR"

# check for the presence of output files before processing the input files. 
# if output file exists, remove it from the directory.

[ -f "$OUTPUT_FILE" ] && rm "$OUTPUT_FILE"

# Append contents of $INPUT_FILE_1 to the OUTPUT_FILE before processing $INPUT_FILE.
if [ -f "$INPUT_FILE_1" ]; then
    cat "$INPUT_FILE_1" >> "$OUTPUT_FILE"
fi

if [ ! -f "$INPUT_FILE" ] && [ ! -f "$INPUT_FILE_1" ]; then
echo "Error: One or more input files not found! Please ensure that both $INPUT_FILE and $INPUT_FILE_1 exist before running the script."
exit 1
fi

echo "Processing file: $INPUT_FILE"
while IFS= read -r line
do

processed_line="PROCESSED: $(echo "$line" | tr '[:lower:]' '[:upper:]')"


echo "$processed_line" >> "$OUTPUT_FILE"

done < "$INPUT_FILE"
echo "Done!"
echo "Processed lines have been saved to: $OUTPUT_FILE"
