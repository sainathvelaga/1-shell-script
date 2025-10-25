#!/bin/bash

# Script: top5cpu.sh
# Description: Display the top 5 CPU-consuming processes in Linux.

echo "=============================================="
echo "   Top 5 CPU Consuming Processes on $(hostname)"
echo "=============================================="
echo ""

# Display the header and top 5 processes sorted by CPU usage
ps -eo pid,user,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo ""
echo "=============================================="
echo "   Report generated on: $(date)"
echo "=============================================="