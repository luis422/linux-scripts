#!/bin/bash

DEBIAN_VERSION=$(cut -d. -f1 /etc/debian_version 2>/dev/null || echo "")

case "$DEBIAN_VERSION" in
    8|9|10|11|12|13)
        echo "Downloading microsoft configuration package for Debian version $DEBIAN_VERSION..."

        curl -sSL "https://packages.microsoft.com/config/debian/$DEBIAN_VERSION/packages-microsoft-prod.deb" -o packages-microsoft-prod.deb
        
        sudo dpkg -i packages-microsoft-prod.deb
        rm packages-microsoft-prod.deb
        ;;
    *)
        echo "Warning: Debian version ($DEBIAN_VERSION) is not supported or could not be identified automatically."
        echo "Please verify compatibility manually."
        ;;
esac