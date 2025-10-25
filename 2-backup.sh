#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to display usage
usage() {
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
}

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Assign variables
SOURCE_DIR=$1
DEST_DIR=$2

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Check if destination directory exists; create if not
if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory '$DEST_DIR' does not exist. Creating it..."
    mkdir -p "$DEST_DIR"
fi

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Get base name of source directory (e.g., /home/user/data → data)
DIR_NAME=$(basename "$SOURCE_DIR")

# Create backup file name
BACKUP_FILE="${DEST_DIR}/${DIR_NAME}_backup_${TIMESTAMP}.tar.gz"

# Create compressed archive
echo "Creating backup..."
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$DIR_NAME"

# Verify backup
if [ -f "$BACKUP_FILE" ]; then
    echo "Backup created successfully: $BACKUP_FILE"
else
    echo "Error: Backup creation failed."
    exit 1
fi