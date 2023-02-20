#!/bin/bash

# Convert PDF to Text using OCR
# need tesseract 
# in Arch Linux
# pacman -S tesseract-data-eng

# Check that a filename argument was provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Set the filename argument to a variable
filename="$1"

# Check that the file exists
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

# Use bash regex to remove the extension from the filename
filename_without_extension="${filename%.*}"

# Create a new variable with the same filename but with a .txt extension
new_filename="$filename_without_extension.txt"


# Run the pdftoppm command with the filename variable
pdftoppm -png "$filename" turing


# Count number of png files generated

count=$(ls -l turing-*\.png | wc -l)

# for i in turing-??.png; do tesseract "$i" "text-$i" -l eng; done;

# for i in count; do tesseract "turing-$i.png" "text-turing$i" -l eng; done;

for (( i=1; i<=count; i++ ))
do
  tesseract "turing-$i.png" "text-turing$i" -l eng
done



# generate a complete file
# cat text-turing* > "$new_filename"
for (( i=1; i<=count; i++ ))
do
  cat "text-turing$i.txt" >> "$new_filename"
done


# Remove unnecessary files
# text-turing1.txt   turing-1.png
for (( i=1; i<=count; i++ ))
do
  rm "text-turing$i.txt" "turing-$i.png"
done


# this file is not needed but is generated during execution
# rm text-count.txt
