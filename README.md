# bash-script
This project features a Bash-based log analysis tool designed for Linux environments, particularly Ubuntu. The main script, analyse-logs.sh, scans application and system logs for critical issues such as ERROR, FATAL, and CRITICAL messages. It identifies logs updated in the last 24–48 hours, analyzes them for error patterns, and generates a detailed report summarizing occurrences, last seen errors, and alert messages when thresholds are exceeded.

The project demonstrates key Bash scripting concepts, including variable usage, arrays, loops, conditional logic, and file I/O. It also includes a structured logs/ directory with sample log files and produces a readable report (log_analysis_report.txt) to support debugging or system monitoring tasks.

Whether you're learning Bash scripting or looking for a lightweight log monitoring tool, this project provides a practical and extensible foundation.

# Log Analysis Bash Script

This project contains a simple yet powerful Bash script (`analyse-logs.sh`) written for the Ubuntu environment. The purpose of this script is to help system administrators and developers **analyze system and application logs**, identifying critical issues based on predefined error patterns.

## 📂 Folder Structure

.
├── analyse-logs.sh
└── logs/
├── application.log
└── system.log

yaml
Copier
Modifier

## 🛠️ What This Script Does

This script follows a step-by-step structure to demonstrate core Bash scripting skills while performing meaningful log file analysis:

---

### 1. ✅ Set Up Bash Environment

The script begins with a shebang line to define the Bash shell:

```bash
#!/bin/bash
This ensures the script is executed in the correct shell environment.

2. ✍️ Create Your First Shell Script
The script (analyse-logs.sh) is a complete and functional Bash script that can be executed from the terminal.

Usage:
bash analyse-logs.sh

3. 📄 File Extensions and Shebang
File has a .sh extension to indicate it's a shell script.

Shebang (#!/bin/bash) is used to define the script interpreter.

4. 💡 Variables in Shell Scripts
Several variables are used to store:

LOG_DIR – the path to the log folder

ERROR_PATTERNS – an array of error levels to search for

REPORT_FILE – where the analysis result is saved

LOG_DIR="/home/terry/Bashscripts/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/home/terry/Bashscripts/logs/log_analysis_report.txt"

5. 📦 Arrays in Shell Scripts
The ERROR_PATTERNS array allows looping through multiple error levels like ERROR, FATAL, and CRITICAL for each log file.

6. 🔁 Loops in Shell Scripts
Two nested for loops are used:

Outer loop: Iterates over each log file updated in the last 24–48 hours.

Inner loop: Iterates over each error pattern for analysis.

7. ✍️ Writing to Files
The script writes the results of its analysis to a file named log_analysis_report.txt inside the logs folder using echo and redirection (>>):

echo "==== Analysing log files in $LOG_DIR directory ====" > "$REPORT_FILE"
It includes:

List of recently updated .log files

Pattern matches (ERROR, FATAL, CRITICAL)

Last occurrence of each pattern

Total count of each pattern

Additionally, it alerts if an error type appears more than 10 times.

📊 Output
The output file log_analysis_report.txt provides a clean report summarizing:

Which logs were checked

Which error types were found

How many times they appeared

Whether any critical attention is needed

🧪 Sample Execution
bash
Copier
Modifier
bash analyse-logs.sh
Result: log_analysis_report.txt will be generated with full error insights.

🔒 Logs Folder
The logs/ folder contains:

application.log

system.log

These are sample log files analyzed by the script.

📌 Requirements
Ubuntu (or any Unix-based OS)

Bash shell

Basic terminal access

📬 Contributing
Feel free to fork this repo, suggest improvements, or submit pull requests for enhancements!
