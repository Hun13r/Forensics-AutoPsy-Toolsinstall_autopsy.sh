#!/bin/bash

################################################################################
#                       Autopsy Installation Script                             #
#                                                                              #
# Name:       Hun13r Forensics                                                 #
# Email:      Admin@greaton.co.uk                                              #
# Company:    Greaton LTD Forensics                                            #
# Version:    1.0                                                              #
#                                                                              #
# Description: This script automates the installation of Autopsy on macOS.     #
# It checks for and installs Homebrew, OpenJDK, Sleuth Kit, and then           #
# downloads and sets up Autopsy for use.                                       #
################################################################################

# Exit script on error
set -e

echo "-------------------------------------------------------------"
echo "        Autopsy Installation Script - Greaton LTD Forensics"
echo "-------------------------------------------------------------"

# Check for Homebrew and install if not present
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Install Java (OpenJDK)
if ! brew list | grep -q openjdk; then
    echo "Installing OpenJDK..."
    brew install openjdk
    sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zprofile
    echo 'export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"' >> ~/.zprofile
    source ~/.zprofile
else
    echo "OpenJDK is already installed."
fi

# Install Sleuth Kit
if ! brew list | grep -q sleuthkit; then
    echo "Installing Sleuth Kit..."
    brew install sleuthkit
else
    echo "Sleuth Kit is already installed."
fi

# Download and Extract Autopsy
AUTOPSY_VERSION="4.20.0"  # Set the desired version here
AUTOPSY_DIR="autopsy-$AUTOPSY_VERSION"
if [ ! -d "$AUTOPSY_DIR" ]; then
    echo "Downloading Autopsy version $AUTOPSY_VERSION..."
    curl -LO "https://downloads.sourceforge.net/project/autopsy/autopsy/$AUTOPSY_VERSION/$AUTOPSY_DIR.zip"
    echo "Extracting Autopsy..."
    unzip "$AUTOPSY_DIR.zip"
else
    echo "Autopsy directory already exists."
fi

# Make Autopsy script executable
echo "Making Autopsy script executable..."
chmod +x "$AUTOPSY_DIR/bin/autopsy"

echo "-------------------------------------------------------------"
echo "Installation completed. To run Autopsy, navigate to the directory and use './bin/autopsy'."
echo "For more information, contact Hun13r Forensics at Admin@greaton.co.uk"
echo "-------------------------------------------------------------"
