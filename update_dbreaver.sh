#!/bin/bash

# Define the URL and file name
URL="https://dbeaver.io/download/?start&os=linux&arch=x86_64&dist=deb"
FILE_NAME="dbeaver.deb"

# Download the file
echo "Downloading dbeaver ADB file..."
wget -O "$FILE_NAME" "$URL"

# Check if the file was downloaded successfully
if [ -f "$FILE_NAME" ]; then
    echo "File downloaded successfully."

    # Install the file using dpkg
    echo "Installing dbeaver..."
    sudo dpkg -i "$FILE_NAME"

    # Check for missing dependencies and fix them
    echo "Fixing any missing dependencies..."
    sudo apt-get install -f -y

    # Clean up the downloaded file
    echo "Cleaning up..."
   

    echo "dbeaver installation completed successfully."
else
    echo "Failed to download the file."
    exit 1
fi

