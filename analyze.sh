#!/bin/bash

LOG_FILE="auth.log"
THRESHOLD=3

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file not found."
    exit 1
fi

echo "SSH LOG ANALYSIS"

sed 's/[[:space:]]\+/ /g' "$LOG_FILE" > cleaned.log

FAILED=$(grep -c "Failed password" cleaned.log)
SUCCESS=$(grep -c "Accepted password" cleaned.log)

echo "Total failed login attempts: $FAILED"
echo "Total successful login attempts: $SUCCESS"

echo
echo "Failed login attempts by IP address:"

grep "Failed password" cleaned.log |
awk '{for(i=1;i<=NF;i++) if($i=="from"){print $(i+1); break}}' |
sort | uniq -c

echo
echo "Suspicious IP addresses (3 or more failures):"

grep "Failed password" cleaned.log |
awk '{for(i=1;i<=NF;i++) if($i=="from"){print $(i+1); break}}' |
sort | uniq -c |
awk -v limit="$THRESHOLD" \
'$1 >= limit {print $2, "-", $1, "failed attempts"}'

echo
echo "ANALYSIS COMPLETE"
