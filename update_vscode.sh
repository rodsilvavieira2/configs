#!/bin/bash

# Define the URL and file name
URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
FILE_NAME="vscode.deb"

# Download the file
echo "Downloading Discord ADB file..."
wget -O "$FILE_NAME" "$URL"

# Check if the file was downloaded successfully
if [ -f "$FILE_NAME" ]; then
    echo "File downloaded successfully."

    # Install the file using dpkg
    echo "Installing VsCode..."
    sudo dpkg -i "$FILE_NAME"

    # Check for missing dependencies and fix them
    echo "Fixing any missing dependencies..."
    sudo apt-get install -f -y

    # Clean up the downloaded file
    echo "Cleaning up..."
    rm "$FILE_NAME"

    echo "VsCode installation completed successfully."
else
    echo "Failed to download the file."
    exit 1
fi

