# Advanced Security Log Analyzer

## Overview

Advanced Security Log Analyzer is a Bash-based cybersecurity tool that analyzes Linux system journal logs to identify authentication-related activity and potential security indicators.

The project uses `journalctl`, `grep`, `awk`, `sed`, `sort`, and `uniq` to extract useful security information from system logs.

The analyzer is designed for defensive security monitoring and log-analysis practice.

## Features

- Detects failed authentication events
- Counts authentication-related failure entries
- Identifies users associated with failed authentication events
- Detects repeated authentication failures using a configurable threshold
- Generates suspicious-activity alerts
- Groups authentication failures by system component
- Reports authentication success/session-related events
- Checks whether the system journal is accessible
- Provides clear terminal-based security reports
- Works directly with Linux `systemd` journal logs
- Requires no external database or third-party framework

## Technologies Used

- Bash
- Linux
- systemd journal
- journalctl
- grep
- awk
- sed
- sort
- uniq
- Regular expressions
- Linux authentication logging

## Project Structure

```text
11-advanced-security-log-analyzer/
├── security_log_analyzer.sh
└── README.md
```

## How It Works

The analyzer reads Linux journal entries using `journalctl` and searches for authentication-related patterns.

The workflow is:

```text
Linux Journal
     ↓
journalctl
     ↓
Authentication Event Filtering
     ↓
Failed Authentication Analysis
     ↓
User-wise Analysis
     ↓
Threshold Detection
     ↓
Component-wise Analysis
     ↓
Security Report
```

## Security Metrics

### 1. Failed Authentication Attempts

The analyzer counts journal entries matching authentication-failure patterns such as:

```text
failed password
authentication failure
```

This provides a basic measurement of authentication failures recorded in the journal.

### 2. Authentication Success/Session Events

The analyzer also counts entries matching:

```text
accepted password
session opened
```

This metric represents matching authentication/session-related journal entries.

It should not be interpreted as an exact count of unique successful logins because multiple session events can be generated for a single login activity.

### 3. Failed Authentication by User

The analyzer extracts entries containing:

```text
user=<username>
```

and groups them to determine which users appear most frequently in authentication-failure events.

### 4. Threshold-Based Detection

The analyzer uses a threshold of:

```text
5 failed attempts
```

If a user reaches or exceeds this threshold, the analyzer generates an alert.

Example:

```text
ALERT: user=example - 8 failed attempts
```

The alert indicates repeated authentication failures that may require investigation.

A threshold alert alone does not prove that an attack occurred.

### 5. Authentication Failure by Component

The analyzer identifies authentication components associated with failure events.

For example:

```text
40 lightdm
17 xfce4-screensaver
```

Possible components include:

- LightDM graphical login manager
- XFCE screensaver authentication

The exact values depend on the system's current journal data.

## Example Output

```text
===== Advanced Security Log Analyzer =====

Security Log Analysis Started...

Failed Authentication Attempts:
<COUNT>

Authentication Success/Session Events:
<COUNT>

Failed Authentication by User:
<COUNT> user=<USERNAME>

Suspicious Authentication Activity:
ALERT: user=<USERNAME> - <COUNT> failed attempts

Authentication Failure by Component:
<COUNT> <COMPONENT>
<COUNT> <COMPONENT>

==========================================
Security analysis completed.
```

## Important Security Interpretation

Repeated authentication failures can be a useful security indicator, but they should not automatically be classified as an attack.

For example, authentication failures may occur because of:

- Incorrect passwords
- Repeated login mistakes
- Screen-lock authentication failures
- Misconfigured services
- Automated services using outdated credentials
- Unauthorized access attempts

Security analysts should investigate the surrounding context before determining the cause.

## Journal Access Handling

Before performing the analysis, the script checks whether the system journal can be accessed.

If journal access is unavailable, the script exits with a clear message instead of producing misleading results.

## Running the Project

Make the script executable:

```bash
chmod +x security_log_analyzer.sh
```

Run it directly:

```bash
./security_log_analyzer.sh
```

Alternatively:

```bash
bash security_log_analyzer.sh
```

## Syntax Validation

The script can be checked without executing it:

```bash
bash -n security_log_analyzer.sh
```

No output indicates that the Bash syntax is valid.

## Real-World Relevance

Security teams routinely analyze authentication and system logs to identify unusual activity.

This project demonstrates foundational concepts used in:

- Security monitoring
- Log analysis
- Incident detection
- Authentication monitoring
- SOC workflows
- Linux security administration
- SIEM-style event analysis

The project also demonstrates how command-line tools can be combined into a lightweight security-analysis pipeline.

## Learning Outcomes

Through this project, the following concepts were practiced:

- Linux system journal analysis
- Authentication event detection
- Regular expressions
- Bash pipelines
- Text processing
- `grep`
- `awk`
- `sed`
- `sort`
- `uniq`
- Threshold-based alerting
- Security event interpretation
- Defensive log analysis
- Linux permissions and executable scripts

## Limitations

This is a lightweight Bash-based analyzer and is not a replacement for a full SIEM platform.

Current limitations include:

- Depends on `systemd` journal availability
- Uses pattern-based detection
- Does not perform IP reputation analysis
- Does not correlate events across multiple systems
- Does not provide a graphical dashboard
- Does not maintain historical analysis databases

## Future Improvements

Possible future enhancements include:

- Time-window based detection
- IP/source analysis when available
- Multiple threshold levels
- JSON/CSV report generation
- Automated log summaries
- Detection of brute-force-like patterns
- Email or notification alerts
- Integration with SIEM platforms
- Web-based security dashboard
- Multi-log source correlation

## Ethical Use

This project is intended for defensive security monitoring, Linux administration, cybersecurity education, and analysis of systems that you own or are authorized to monitor.

Do not use the analyzer or collected security logs to access, monitor, or investigate systems without proper authorization.
