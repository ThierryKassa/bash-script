#!/bin/bash

LOG_DIR="/home/terry/Bashscripts/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/home/terry/Bashscripts/logs/log_analysis_report.txt"

echo -e "\n===========================================================" > "$REPORT_FILE"
echo "==== Analysing log files in $LOG_DIR directory ====" > "$REPORT_FILE"
echo "===========================================================" >> "$REPORT_FILE"

echo -e "\n### List of log files updated in last 24-48 hours ###" >> "$REPORT_FILE"
LOG_FILES=$(find "$LOG_DIR" -name "*.log" -mtime 1)
echo "$LOG_FILES" >> "$REPORT_FILE"


for LOG_FILE in $LOG_FILES; do

    echo -e "\n===================================================" >> "$REPORT_FILE"
    echo "============ $LOG_FILE ============" >> "$REPORT_FILE"
    echo "===================================================" >> "$REPORT_FILE"

    for PATTERN in ${ERROR_PATTERNS[@]}; do

        echo -e "\n### searching $PATTERN logs in $LOG_FILE file ###" >> "$REPORT_FILE"
        grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

        echo -e "\n### The last $PATTERN from $LOG_FILE ###" >> "$REPORT_FILE"
        grep "$PATTERN" "$LOG_FILE" | tail -1 >> "$REPORT_FILE"

        echo -e "\n### Number of $PATTERN found in $LOG_FILE ###" >> "$REPORT_FILE"

        ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
        echo $ERROR_COUNT >> "$REPORT_FILE"

        if [ "$ERROR_COUNT" -gt 10 ]; then
            echo -e "\n ⚠️  Action Required: too many $PATTERN issues in log file $LOG_FILE"
        fi

        
    done      
done

echo -e "\nLog analysis completed and report saved in: $REPORT_FILE"