# Log Analyzer

A Bash-based log analysis tool that reads a log file and extracts useful information such as total log entries, error entries, warning entries, and the most frequent IP addresses.

## Features

- Validates whether the log file exists
- Counts total log entries
- Counts error entries
- Counts warning entries
- Finds the top 5 most frequent IP addresses
- Uses standard Linux command-line tools
- Simple and beginner-friendly Bash implementation

## Technologies Used

- Bash
- grep
- awk
- sort
- uniq
- head
- wc

## How to Run

Make the script executable:

    chmod +x log_analyzer.sh

Run the analyzer:

    ./log_analyzer.sh

Enter the path of the log file when prompted.

## Example

    ===== Log Analyzer =====
    Enter log file path: access.log

    Total log entries: 10
    Error entries: 4
    Warning entries: 2

    Top IP Addresses:
          4 192.168.1.20
          3 192.168.1.10
          2 192.168.1.30
          1 192.168.1.40

    ==============================
    Log analysis completed.

## Learning Outcomes

This project demonstrates practical usage of:

- File validation
- User input
- Conditional statements
- Command substitution
- grep for pattern searching
- awk for field extraction
- sort for ordering data
- uniq for counting repeated values
- head for limiting results
- wc for counting lines

## Future Improvements

- Detect suspicious IP addresses
- Analyze authentication failures
- Generate security reports
- Support multiple log formats
- Add date/time based filtering
- Export analysis results to a report file
