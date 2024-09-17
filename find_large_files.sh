#!/bin/bash

# Set the size threshold (in this case, 1GB = 1073741824 bytes)
SIZE_THRESHOLD=1G

# Set the directories to exclude (optional, but you might want to avoid searching in certain directories)
EXCLUDE_DIRS="/proc /sys /dev /run"

# Find files larger than 1GB, excluding certain directories
echo "Searching for files larger than 1GB on the AlmaLinux system..."

find / -type f -size +$SIZE_THRESHOLD -exec ls -lh {} \; 2>/dev/null | awk '{ print $NF ": " $5 }'

echo "Search complete."

# Optional: Save the output to a file for future reference
OUTPUT_FILE="large_files_report.txt"
find / -type f -size +$SIZE_THRESHOLD -exec ls -lh {} \; 2>/dev/null | awk '{ print $NF ": " $5 }' > "$OUTPUT_FILE"

echo "Results saved to $OUTPUT_FILE"
