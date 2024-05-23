#!/bin/bash

# Function to add Radxa APT repository
apply_config() {
    local suite="$1"
    local managed_keyring_repo="radxa-pkg/radxa-archive-keyring"
    local radxa_mirror="https://radxa-repo.github.io/"

    # get the keyring
    temp="$(mktemp)"
    version="$(curl -L https://github.com/$managed_keyring_repo/releases/latest/download/VERSION)"
    curl -L --output "$temp" "https://github.com/$managed_keyring_repo/releases/latest/download/radxa-archive-keyring_${version}_all.deb"
    dpkg -i "$temp"
    rm -f "$temp"

    # add bullseye repo
    echo "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] $radxa_mirror$suite $suite main" > /etc/apt/sources.list.d/radxa.list
    curl -L -o /etc/radxa_apt_snapshot $radxa_mirror$suite/pkgs.json

    # add rockchip-bullseye repo
    echo "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] $radxa_mirror$suite rockchip-$suite main" > /etc/apt/sources.list.d/radxa-rockchip.list
    curl -L -o /etc/radxa_apt_snapshot $radxa_mirror$suite/pkgs.json
}

# Function to revert Radxa APT repository
revert_config() {
    rm /etc/apt/sources.list.d/radxa.list
    rm /etc/apt/preferences.d/radxa-conf
    # Add any additional cleanup here
}

# Check the action argument
if [ "$1" == "apply" ]; then
    DEB_SUITE="$2"
    apply_config "$DEB_SUITE"
    echo "Configuration applied for suite $DEB_SUITE."
elif [ "$1" == "revert" ]; then
    revert_config
    echo "Configuration reverted."
else
    echo "Usage: $0 [apply|revert] [<suite>]"
    exit 1
fi
