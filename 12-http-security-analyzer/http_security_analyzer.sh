#!/bin/bash

echo "===== HTTP Security Analyzer ====="

echo
read -p "Enter website URL: " url

echo
echo "Target: $url"

echo
echo "HTTP Security Analysis Started..."

echo
echo "HTTPS Security Check:"

if [[ "$url" == https://* ]]
then
    echo "HTTPS: ENABLED"
else
    echo "HTTPS: NOT USED"
fi

echo
echo "HTTP Status Code:"

if headers=$(curl -sS -I --http1.1 "$url")
then
    status_code=$(echo "$headers" | head -1 | awk '{print $2}')
    echo "$status_code"
else
    echo "Unable to connect to the target."
    echo "Please check the URL, DNS, or network connection."
    exit 1
fi

echo
echo "Server Information:"

server=$(echo "$headers" | grep -i "^Server:" | head -1)

if [ -n "$server" ]
then
    echo "$server"
else
    echo "Server information not disclosed."
fi

echo
echo "Redirect Detection:"

if echo "$headers" | grep -qi "^Location:"
then
    echo "Redirect detected:"
    echo "$headers" | grep -i "^Location:"
else
    echo "No redirect detected."
fi

echo
echo "Security Headers:"

security_headers=(
    "Strict-Transport-Security"
    "Content-Security-Policy"
    "X-Content-Type-Options"
    "X-Frame-Options"
)

present_count=0
missing_count=0

for header in "${security_headers[@]}"
do
    if echo "$headers" | grep -qi "^$header:"
    then
        echo "[PRESENT] $header"
        ((present_count++))
    else
        echo "[MISSING] $header"
        ((missing_count++))
    fi
done

echo
echo "Security Header Summary:"
echo "Present: $present_count"
echo "Missing: $missing_count"
echo "Total Checked: ${#security_headers[@]}"

echo
echo "=================================="
echo "HTTP security analysis completed."

