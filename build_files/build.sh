#!/bin/bash
set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Install packages

## rocm-smi is deprecated but still needed for btop

dnf5 install -y \
    terminator \
    atop \
    rocm-smi

# Enable/disable system unit files

systemctl disable cups.service cups.socket cups.path
