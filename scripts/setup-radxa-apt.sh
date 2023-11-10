#!/bin/bash

# Function to add Radxa APT repository
apply_config() {
    local suite="$1"

    # Add the repository and import the GPG key
    echo "deb http://apt.radxa.com/${suite}-stable/ ${suite} main" | tee -a /etc/apt/sources.list.d/apt-radxa-com.list
    wget -O - apt.radxa.com/${suite}-stable/public.key | apt-key add -

    # Add package pinning
    echo "Package: *" > /etc/apt/preferences.d/radxa-conf
    echo "Pin: origin apt.radxa.com" >> /etc/apt/preferences.d/radxa-conf
    echo "Pin-Priority: 900" >> /etc/apt/preferences.d/radxa-conf
}

# Function to revert Radxa APT repository
revert_config() {
    rm /etc/apt/sources.list.d/apt-radxa-com.list
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
