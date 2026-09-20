# Network Diagnostics Tool

A Bash-based network diagnostics tool that collects and analyzes important networking information from the current Linux system.

The tool is designed to help understand basic network configuration, connectivity, DNS resolution, routing, and network latency using standard Linux commands.

## Features

- Displays active and inactive network interfaces
- Displays assigned IP addresses
- Shows the default gateway
- Displays DNS configuration
- Checks Internet connectivity
- Measures network latency
- Checks DNS resolution
- Displays the routing table
- Works directly with the current Linux system
- Does not require sample or test files

## Technologies Used

- Bash
- Linux networking commands
- ip
- grep
- ping
- getent
- tail

## How to Run

Make the script executable:

    chmod +x network_diagnostics.sh

Run the network diagnostics tool:

    ./network_diagnostics.sh

## Diagnostics Performed

### 1. Network Interfaces

The tool uses:

    ip -br addr

to display network interfaces, their state, and assigned IP addresses.

### 2. Default Gateway

The tool uses:

    ip route | grep default

to identify the default route and gateway used by the system.

### 3. DNS Configuration

The tool reads DNS configuration from:

    /etc/resolv.conf

and displays configured nameservers.

### 4. Internet Connectivity

The tool sends a single ICMP packet to 8.8.8.8 to check whether the system can reach the Internet.

### 5. Network Latency

The tool sends four ICMP packets to 8.8.8.8 and displays the latency statistics.

Latency represents the approximate round-trip time required for packets to reach the destination and return.

### 6. DNS Resolution

The tool uses:

    getent hosts google.com

to verify whether the system can resolve a domain name to an IP address.

### 7. Routing Table

The tool uses:

    ip route

to display the system's routing information.

## Example Output

    ===== Network Diagnostics Tool =====

    Network Interfaces:
    lo        UNKNOWN   127.0.0.1/8
    eth0      UP        10.0.2.15/24

    Default Gateway:
    default via 10.0.2.2 dev eth0

    DNS Configuration:
    nameserver 192.168.133.153

    Internet Connectivity:
    Internet connection: AVAILABLE

    Network Latency:
    4 packets transmitted, 4 received, 0% packet loss

    DNS Resolution:
    DNS resolution: WORKING

    Routing Table:
    default via 10.0.2.2 dev eth0

    ========================================
    Network diagnostics completed.

## Networking Concepts Learned

This project introduces practical networking concepts including:

- Network interfaces
- IPv4 addresses
- IPv6 addresses
- Default gateway
- DNS
- Routing
- ICMP
- Connectivity
- Network latency
- Packet loss

## Real-World Use

Network diagnostics are commonly used for troubleshooting problems such as:

- No Internet connectivity
- Incorrect network configuration
- DNS failures
- Gateway problems
- High network latency
- Routing issues
- Interface failures

## Security Relevance

Understanding network configuration is an important foundation for cybersecurity.

Before analyzing ports, services, traffic, or suspicious network activity, it is necessary to understand:

- Which interfaces are active
- Which IP addresses are assigned
- Where traffic is routed
- Which DNS servers are configured
- Whether the system has network connectivity

## Learning Outcomes

This project demonstrates:

- Bash scripting
- Linux networking
- Conditional statements
- Command pipelines
- Network troubleshooting
- IP addressing
- Routing concepts
- DNS concepts
- Connectivity testing
- Network latency analysis

## Future Improvements

- Add network interface statistics
- Detect packet loss percentage automatically
- Test multiple DNS servers
- Check gateway reachability
- Display public IP address
- Add TCP connectivity checks
- Generate a complete network diagnostic report
- Add command-line options for individual checks
