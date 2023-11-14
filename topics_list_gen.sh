#!/bin/bash

# Path to the .txt file
inputFile="topicslist.txt"

# Read each line from the .txt file
while IFS= read -r line
do
    # Replace spaces with underscores and make lowercase for permalink
    sanitizedLine=$(echo "$line" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')

    # Construct the .markdown file name
    markdownFile="${sanitizedLine}.markdown"

    # Check if the .markdown file exists
    if [ ! -f "$markdownFile" ]; then
        # Create and write to the .markdown file
        echo "---" > "$markdownFile"
        echo "layout: page" >> "$markdownFile"
        echo "title: $line" >> "$markdownFile"
        echo "permalink: /$sanitizedLine/" >> "$markdownFile"
        echo "usemathjax: true" >> "$markdownFile"
        echo "---" >> "$markdownFile"
    fi
done < "$inputFile"

