# Autopsy Installation Script

## Overview
This script automates the installation of Autopsy on macOS. It performs the following tasks:
- Installs Homebrew if it's not already installed.
- Installs Java (OpenJDK) using Homebrew.
- Installs Sleuth Kit, which is a requirement for Autopsy.
- Downloads and extracts the latest version of Autopsy.
- Sets up the necessary environment variables for Java and Sleuth Kit.

## Creator Information
- **Name:** Hun13r Forensics
- **Email:** Admin@greaton.co.uk
- **Company:** Greaton Forensics
- **Version:** 1.0

## Prerequisites
- macOS system with an internet connection.
- Basic knowledge of using the Terminal.

## Instructions

### 1. Download the Script
Download or copy the `install_autopsy.sh` script and save it to a directory on your macOS system.

### 2. Make the Script Executable
Before running the script, you need to give it execute permissions. Open Terminal and navigate to the directory where the script is saved. Then, run the following command:
```bash
chmod +x install_autopsy.sh
