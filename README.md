Here's how you can write a **README** file for running the bash script that fetches all files larger than 1GB from an AlmaLinux system with **WHM** and **cPanel** installed.

### README

---

# Fetch Large Files (1GB+) from AlmaLinux System

This script searches the entire AlmaLinux filesystem for files larger than **1GB** and outputs their locations. It is useful for identifying large files that may be consuming significant disk space on servers running **WHM** and **cPanel**.

## Prerequisites

- **AlmaLinux** operating system.
- **WHM/cPanel** installed on the server.
- **Bash** installed (default on AlmaLinux).
- **Root access** or **sudo** privileges to run the script.

## Steps to Run the Script

### 1. Download the Script

You can either create the script manually or download it from the repository.

To create the script manually, use the following steps:

1. Open a terminal window and navigate to the directory where you want to save the script.
2. Create a new bash script file named `find_large_files.sh`:
   ```bash
   nano find_large_files.sh
   ```

3. Paste the following script into the file:
   ```bash
   #!/bin/bash

   # Set the size threshold (1GB)
   SIZE_THRESHOLD=1G

   # Set the directories to exclude (optional)
   EXCLUDE_DIRS="/proc /sys /dev /run"

   # Find files larger than 1GB, excluding certain directories
   echo "Searching for files larger than 1GB on the AlmaLinux system..."

   find / -type f -size +$SIZE_THRESHOLD -exec ls -lh {} \; 2>/dev/null | awk '{ print $NF ": " $5 }'

   echo "Search complete."

   # Optional: Save the output to a file for future reference
   OUTPUT_FILE="large_files_report.txt"
   find / -type f -size +$SIZE_THRESHOLD -exec ls -lh {} \; 2>/dev/null | awk '{ print $NF ": " $5 }' > "$OUTPUT_FILE"

   echo "Results saved to $OUTPUT_FILE"
   ```

4. Save the file and exit the editor (`Ctrl+X`, then `Y` and `Enter`).

### 2. Make the Script Executable

Before you can run the script, you need to give it executable permissions.

In the terminal, run the following command:

```bash
chmod +x find_large_files.sh
```

### 3. Run the Script

To run the script and search for files larger than 1GB on your AlmaLinux system, use the following command:

```bash
sudo ./find_large_files.sh
```

- **Note:** You may need to run this script with `sudo` to have the necessary permissions to access system files.

### 4. View the Results

The script will output the paths and sizes of all files larger than 1GB. It will also save the results to a file called `large_files_report.txt` in the same directory where the script is located.

To view the results, you can open the report file:

```bash
cat large_files_report.txt
```

### 5. Customization

You can customize the script to change the size threshold or exclude specific directories:
- **Size Threshold:** Modify the `SIZE_THRESHOLD` variable to any other value, such as `500M` for files larger than 500MB.
- **Exclude Directories:** Update the `EXCLUDE_DIRS` variable to exclude certain directories from being searched.

---

### Example Output

```
Searching for files larger than 1GB on the AlmaLinux system...
/var/log/large-log-file.log: 2.1G
/home/user/backup.tar.gz: 1.5G
...
Search complete.
Results saved to large_files_report.txt
```

---

### Conclusion

This script helps you identify large files on your AlmaLinux system that may be consuming disk space, which is particularly useful for WHM/cPanel systems where server disk usage can quickly become a critical issue.
