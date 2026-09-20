# System Information Reporter

A Bash-based system information reporting tool that collects and displays important information about the current Linux system.

## Features

- Displays the operating system
- Displays the kernel version
- Displays the system hostname
- Displays the current logged-in user
- Displays CPU information
- Displays memory usage
- Displays disk usage
- Displays system uptime
- Displays network IP addresses
- Works directly with the current system
- Does not require any sample or test data

## Technologies Used

- Bash
- uname
- hostname
- whoami
- lscpu
- grep
- free
- df
- uptime

## How to Run

Make the script executable:

    chmod +x system_info.sh

Run the system information reporter:

    ./system_info.sh

## Example Output

    ===== System Information Reporter =====

    Operating System:
    Linux

    Kernel Version:
    6.x.x

    Hostname:
    kali

    Current User:
    user

    CPU Information:
    Model name: ...

    Memory Information:
    ...

    Disk Usage:
    ...

    System Uptime:
    up ...

    Network Information:
    ...

    ========================================
    System information report completed.

## How It Works

The script collects information directly from the Linux operating system using standard command-line utilities.

- `uname` provides operating system and kernel information.
- `hostname` provides the system hostname.
- `whoami` identifies the current user.
- `lscpu` provides CPU information.
- `free` displays memory usage.
- `df` displays disk usage.
- `uptime` shows how long the system has been running.
- `hostname -I` displays the system's assigned IP addresses.

## Learning Outcomes

This project demonstrates:

- Bash scripting
- Command execution
- Command substitution
- Linux system utilities
- Reading system information
- Combining multiple Linux commands
- Creating executable Bash scripts

## Future Improvements

- Add CPU usage percentage
- Add battery status
- Add GPU information
- Add network interface details
- Generate a report file
- Add colored terminal output
- Add command-line options for selective information
