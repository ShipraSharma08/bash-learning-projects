#!/bin/bash

echo "===== System Information Reporter ====="

echo
echo "Operating System:"
uname -s

echo
echo "Kernel Version:"
uname -r

echo
echo "Hostname:"
hostname

echo
echo "Current User:"
whoami
echo
echo "CPU Information:"
lscpu | grep "Model name"
echo
echo "Memory Information:"
free -h
echo
echo "Disk Usage:"
df -h /
echo
echo "System Uptime:"
uptime -p
echo
echo "Network Information:"
hostname -I
echo
echo "========================================"
echo "System information report completed."

