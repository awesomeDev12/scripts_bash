# Add ocr layout to pdf files

# Need pdftk and tesseract and imagemagick (convert command)
# pacman -sS pdftk
# pacman -S pdftk
# pacman -sS tesseract-data-eng
# pacman -S tesseract-data-eng
# pacman -S imagemagick


# Check for the correct number of arguments
if [ $# -ne 1 ]; then
  echo "Usage: $0 input.pdf"
  exit 1
fi

# Assign the command-line arguments to variables
input_file=$1
filename="$input_file"

# Check that the file exists
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

extra="-with-OCR"

# Use bash regex to remove the extension from the filename
filename_without_extension="${filename%.*}"

# Create a new variable with the same filename but with a underscore at the end
new_filename="$filename_without_extension$extra"

output_file="$new_filename"

# Convert the PDF file to a TIFF image
convert -density 300 "$input_file" -depth 8 -strip -background white -alpha off "${output_file%.*}.tiff"


# Check if .TIFF file was created by imagemagick
if [ ! -f "$output_file.tiff" ]; then
  echo "TIFF image could notbe created with imagemagick (convert command)"
  echo "File not found: $output_file.tiff"
  exit 1
fi

# Use tesseract to add OCR text to the TIFF image
tesseract "${output_file%.*}.tiff" "${output_file%.*}" pdf


# Check if .PDF was created by tesseract
if [ ! -f "$output_file.pdf" ]; then
  echo "PDF file could not be created with tesseract (tesseract command)"
  echo "File not found: $output_file.pdf"
  exit 1
fi

# Add the OCR text to the input file and save as output file
pdftk "$input_file" background "${output_file%.*}.pdf" output "$output_file"

# Delete redundant files
# rm "$filename_without_extension$extra"
# rm "$filename_without_extension$extra.tiff"
rm "$output_file"
rm "$output_file.tiff"
