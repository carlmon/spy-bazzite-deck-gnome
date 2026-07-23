#!/bin/bash
set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Uninstall packages from base. End with '|| true' to ignore missing packages 

dnf5 remove -y \
    passim \
    qemu-guest-agent \
    virtualbox-guest-additions \
    || true

# Install packages

## rocm-smi is deprecated but still needed for btop

dnf5 install -y \
    aria2 \
    atop \
    doublecmd-gtk \
    mediainfo \
    miller \
    nmap \
    iotop-c \
    plocate \
    rocm-smi \
    terminator \
    trash-cli \
    xclip

# Enable/disable system unit files

systemctl disable cups.service cups.socket cups.path
