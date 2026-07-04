#!/bin/bash
set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Install packages

## rocm-smi is deprecated but still needed for btop

dnf5 install -y \
    aria2 \
    atop \
    doublecmd-gtk \
    mediainfo \
    miller \
    plocate \
    rocm-smi \
    terminator \
    trash-cli

# Enable/disable system unit files

systemctl disable cups.service cups.socket cups.path
