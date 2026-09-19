#!/bin/bash
echo "===== System Health Monitor ====="
echo "OS: $(uname -s)"
echo "Kernel: $(uname -r)"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Uptime: $(uptime -p)"
echo "CPU: $(lscpu | grep 'Model name' | sed 's/Model name:[[:space:]]*//')"
echo "RAM: $(free -h | awk '/Mem:/ {print $3 " used / " $2 " total"}')"
echo "Disk: $(df -h / | awk 'NR==2 {print $3 " used / " $2 " total (" $5 " used)"}')"
echo "=============================="

