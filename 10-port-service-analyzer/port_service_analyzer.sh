#!/bin/bash

echo "===== Port & Service Analyzer ====="

echo
echo "Listening Ports:"
ss -tuln
echo
echo "TCP Listening Ports:"
ss -ltn
echo
echo "UDP Listening Ports:"
ss -lun
echo
echo
echo "Listening Ports with Processes:"

if [ "$EUID" -eq 0 ]
then
    ss -tulpn
else
    echo "Process information requires elevated privileges."
    echo "Run this script with sudo for process details:"
    echo "sudo ./port_service_analyzer.sh"
fi
echo
echo "Established Connections:"
ss -tun
echo
echo "========================================"
echo "Port and service analysis completed."
