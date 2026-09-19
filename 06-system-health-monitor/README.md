# System Health Monitor

A command-line system information and health monitoring tool built with Bash scripting.

## Features

- Displays operating system information
- Displays Linux kernel version
- Shows system hostname
- Shows current logged-in user
- Displays system uptime
- Detects CPU model
- Shows RAM usage
- Shows disk usage
- Provides clean formatted output

## Information Displayed

| Information | Command Used |
|-------------|--------------|
| OS | `uname -s` |
| Kernel | `uname -r` |
| Hostname | `hostname` |
| User | `whoami` |
| Uptime | `uptime -p` |
| CPU | `lscpu` |
| RAM | `free -h` |
| Disk | `df -h` |

## How to Run

Make the script executable:

chmod +x system_monitor.sh

Run the monitor:

./system_monitor.sh

## Example Output

===== System Health Monitor =====
OS: Linux
Kernel: 6.x.x
Hostname: kali
User: shipra
Uptime: up 1 hour
CPU: Intel Processor
RAM: 1Gi used / 4Gi total
Disk: 24G used / 58G total (43% used)
==============================

## Technologies

- Bash
- Linux
- Nano
- Git
- GitHub

## Bash Concepts Practiced

- Command substitution using `$()`
- Variables
- `echo`
- `uname`
- `hostname`
- `whoami`
- `uptime`
- `lscpu`
- `free`
- `df`
- `grep`
- `sed`
- `awk`
- `.gitignore`

## Learning Outcomes

This project helped me practice Linux system commands, command substitution, text processing, system resource monitoring, and building practical Bash command-line tools.
