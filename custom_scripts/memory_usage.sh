#!/bin/bash

# Get memory usage using the free command
memory_info="$(free -h | awk '/^Mem\./ {print $3}')"

# Output JSON format for Waybar
echo "{\"text\": \"$memory_info\"}"

