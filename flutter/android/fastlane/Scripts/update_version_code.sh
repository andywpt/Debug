#!/bin/bash

# Check if the script received the required arguments
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <build_gradle_file_path> <new_version_code>"
    exit 1
fi

# Store the file path and new version code passed as arguments
BUILD_GRADLE_FILE=$1
NEW_VERSION_CODE=$2

# Check if the file exists
if [ ! -f "$BUILD_GRADLE_FILE" ]; then
    echo "Error: File '$BUILD_GRADLE_FILE' does not exist."
    exit 1
fi

# Use sed to replace the versionCode line
sed -i.bak "s/versionCode = flutter.versionCode/versionCode = $NEW_VERSION_CODE/" "$BUILD_GRADLE_FILE"

# Verify if the replacement was successful
if grep -q "versionCode = $NEW_VERSION_CODE" "$BUILD_GRADLE_FILE"; then
    echo "Successfully updated versionCode to $NEW_VERSION_CODE in $BUILD_GRADLE_FILE"
else
    echo "Failed to update versionCode in $BUILD_GRADLE_FILE"
fi

# Optional: remove the backup file created by sed
rm -f "${BUILD_GRADLE_FILE}.bak"
