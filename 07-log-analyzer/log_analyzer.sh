#!/bin/bash
echo "===== Log Analyzer ====="
read -p "Enter log file path: " log_file
if [ ! -f "$log_file" ]; then
    echo "Error: Log file does not exist."
    exit 1
fi
total_lines=$(wc -l < "$log_file")
echo "Total log entries: $total_lines"
error_count=$(grep -ic "error" "$log_file")
echo "Error entries: $error_count"
warning_count=$(grep -ic "warning" "$log_file")
echo "Warning entries: $warning_count"
echo
echo "Top IP Addresses:"
awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -5
echo "=============================="
echo "Log analysis completed."

