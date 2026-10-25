#!/usr/bin/env bash

set -euo pipefail

APPIMAGE="./OpenRGB.AppImage"
RULES="/etc/udev/rules.d/60-openrgb.rules"

echo "Downloading OpenRGB..."

curl https://codeberg.org/OpenRGB/OpenRGB/releases/download/release_1.1/OpenRGB_1.1_x86_64_8e16de2.AppImage --output $APPIMAGE

chmod +x OpenRGB.AppImage

if [[ ! -f "$APPIMAGE" ]]; then
    echo "Error: $APPIMAGE not found."
    exit 1
fi

echo "Setting modules conf..."

sudo tee /etc/modules-load.d/i2c.conf <<'EOF'
i2c-dev
i2c-piix4
i2c-i801
EOF

echo "Installing OpenRGB udev rules..."

sudo mkdir -p "$(dirname "$RULES")"
sudo "$APPIMAGE" --generate-udev-rules "$RULES"
sudo udevadm control --reload-rules
sudo udevadm trigger

echo "Done: $RULES"
