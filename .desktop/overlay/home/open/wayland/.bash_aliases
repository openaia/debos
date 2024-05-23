# change PS1
PS1='=> '

# start weston
# Check if Weston is already running
if pgrep -x "weston" >/dev/null; then
    echo "Weston is already running."
else
    # Start Weston
    weston
fi
