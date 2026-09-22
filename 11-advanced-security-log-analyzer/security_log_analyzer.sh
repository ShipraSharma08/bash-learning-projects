#!/bin/bash
if ! journalctl --no-pager -n 1 > /dev/null 2>&1
then
    echo "Error: Unable to access system journal."
    echo "Try running the analyzer with appropriate permissions."
    exit 1
fi
echo "===== Advanced Security Log Analyzer ====="

echo
echo "Security Log Analysis Started..."

echo
echo "Failed Authentication Attempts:"
failed_auth=$(journalctl | grep -Eic "failed password|authentication failure")
echo "$failed_auth"

echo
echo Authentication Success/Session Events:
successful_auth=$(journalctl | grep -Eic "accepted password|session opened")
echo "$successful_auth"

echo
echo "Failed Authentication by User:"
user_failures=$(journalctl | grep -Ei "failed password|authentication failure" \
| grep -oE 'user=[^ ]+' \
| sort \
| uniq -c \
| sort -nr)

echo "$user_failures"

echo
echo "Suspicious Authentication Activity:"
echo "$user_failures" | awk '$1 >= 5 {print "ALERT:", $2, "-", $1, "failed attempts"}'

echo
echo "Authentication Failure by Component:"
journalctl | grep -Ei "failed password|authentication failure" \
| grep -oE 'pam_unix\([^:]+' \
| sed 's/pam_unix(//' \
| sort \
| uniq -c \
| sort -nr

echo
echo "=========================================="
echo "Security analysis completed."
