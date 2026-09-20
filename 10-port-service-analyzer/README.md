# Port & Service Analyzer

A Bash-based Linux networking utility that analyzes listening ports, TCP/UDP sockets, running network connections, and associated processes.

The project is designed to build practical understanding of Linux networking and introduce basic network-security concepts such as exposed ports, listening services, process identification, and privilege-aware diagnostics.

## Features

- Displays listening TCP and UDP sockets
- Separately displays TCP listening ports
- Separately displays UDP listening ports
- Displays listening ports with associated processes
- Shows process information when elevated privileges are available
- Handles insufficient privileges safely
- Displays active network connections
- Uses real-time information from the current Linux system
- Does not require sample or test files

## Technologies Used

- Bash
- Linux
- ss
- TCP/IP networking
- UDP
- Linux process management
- Linux permissions

## How to Run

Make the script executable:

    chmod +x port_service_analyzer.sh

Run normally:

    ./port_service_analyzer.sh

For process and PID information, run with elevated privileges:

    sudo ./port_service_analyzer.sh

## Why sudo Is Used

Basic socket information can be viewed without elevated privileges.

However, Linux may restrict access to process information associated with sockets.

For example, the following command can provide additional process information when executed with appropriate privileges:

    sudo ss -tulpn

The script therefore checks the current privilege level instead of blindly using sudo.

When running normally, the script displays:

    Process information requires elevated privileges.
    Run this script with sudo for process details:
    sudo ./port_service_analyzer.sh

When running with sudo, process information such as the process name, PID, and file descriptor can be displayed.

## Commands Used

### ss

The main command used by this project is:

    ss

`ss` is a Linux utility used to inspect sockets and network connections.

### Listening Ports

    ss -tuln

Displays TCP and UDP listening sockets using numeric addresses and ports.

Options:

- `-t` → TCP
- `-u` → UDP
- `-l` → listening sockets
- `-n` → numeric addresses and ports

### TCP Listening Ports

    ss -ltn

Displays only TCP listening sockets.

### UDP Listening Ports

    ss -lun

Displays only UDP listening sockets.

### Listening Ports With Processes

    ss -tulpn

Displays listening TCP/UDP sockets along with associated process information when sufficient privileges are available.

Additional option:

- `-p` → show process information

## Understanding Listening Ports

A listening port means that a network service or process is waiting for an incoming connection on that port.

For example:

    127.0.0.1:41853

means a service is listening on port `41853` on the local loopback interface.

`127.0.0.1` refers to the local machine.

A listening socket does not necessarily mean that an active connection currently exists.

## Listening vs Established

### LISTEN

A service is waiting for incoming connections.

    LISTEN

### ESTABLISHED

An active connection has already been established between endpoints.

The project displays active connections using:

    ss -tun

## TCP and UDP

### TCP

TCP is connection-oriented and provides reliable, ordered data delivery.

Common examples include:

- SSH
- HTTP
- HTTPS

### UDP

UDP is connectionless and has lower protocol overhead.

It is commonly used by services such as:

- DNS
- DHCP
- Streaming
- Real-time applications

## Process and Port Relationship

A network service is usually implemented by a process.

The relationship can be viewed as:

    Port
      ↓
    Socket
      ↓
    Process
      ↓
    PID

For example:

    Port 41853
        ↓
    containerd
        ↓
    PID

This relationship is useful when investigating which application is responsible for a network endpoint.

## Active Connections

The project uses:

    ss -tun

to display current TCP and UDP socket activity.

This can show information such as:

- Local address
- Local port
- Remote address
- Remote port
- Connection state

## Example Output

    ===== Port & Service Analyzer =====

    Listening Ports:
    tcp    LISTEN    0    4096    127.0.0.1:41853    0.0.0.0:*

    TCP Listening Ports:
    LISTEN    0    4096    127.0.0.1:41853    0.0.0.0:*

    UDP Listening Ports:

    Listening Ports with Processes:
    tcp    LISTEN    0    4096    127.0.0.1:41853    0.0.0.0:*
    users:(("containerd",pid=823,fd=10))

    Established Connections:
    udp    ESTAB    0    0    10.0.2.15:68    10.0.2.2:67

    ========================================
    Port and service analysis completed.

## Security Relevance

Open or listening ports can expose network services.

Security analysis therefore involves questions such as:

- Which ports are listening?
- Which protocol is being used?
- Which process owns the socket?
- Which interface is the service bound to?
- Are active connections expected?
- Is the service intentionally exposed?

A listening port by itself does not prove that a system is vulnerable or compromised. It is an indicator that should be investigated in context.

## Important Network Concepts

This project introduces:

- Ports
- Sockets
- TCP
- UDP
- Listening state
- Established connections
- Local and remote addresses
- Process IDs
- Network services
- Loopback interface
- Privileged processes
- Linux permissions

## Real-World Use Cases

This type of analysis can help with:

- Network troubleshooting
- Identifying listening services
- Understanding local network exposure
- Investigating unexpected connections
- Mapping processes to network sockets
- Basic host security assessment

## Learning Outcomes

This project demonstrates:

- Bash scripting
- Linux networking
- Socket inspection
- TCP/UDP analysis
- Process identification
- Linux privilege handling
- Conditional statements
- Command-line networking tools
- Basic security analysis

## Future Improvements

- Resolve port numbers to service names
- Add process names and PIDs in a cleaner format
- Compare current ports against a known baseline
- Detect newly opened ports
- Add suspicious-port warnings
- Add command-line options
- Export results to a report file
- Add timestamped analysis
- Add local firewall status
- Integrate controlled Nmap-based scanning for authorized targets

## Disclaimer

This tool is intended for learning, troubleshooting, and authorized security analysis of systems you own or have permission to inspect.
