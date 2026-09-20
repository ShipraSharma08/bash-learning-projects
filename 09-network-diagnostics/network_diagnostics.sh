#!/bin/bash

echo "===== Network Diagnostics Tool ====="

echo
echo "Network Interfaces:"
ip -br addr
echo
echo "Default Gateway:"
ip route | grep default
echo
echo "DNS Configuration:"
grep -E "^(nameserver|search)" /etc/resolv.conf
echo
echo "Internet Connectivity:"
if ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1
then
    echo "Internet connection: AVAILABLE"
else
    echo "Internet connection: NOT AVAILABLE"
fi
echo
echo "Network Latency:"
ping -c 4 8.8.8.8 | tail -2
echo
echo "DNS Resolution:"
if getent hosts google.com > /dev/null 2>&1
then
    echo "DNS resolution: WORKING"
else
    echo "DNS resolution: FAILED"
fi
echo
echo "Routing Table:"
ip route
echo
echo "========================================"
echo "Network diagnostics completed."

