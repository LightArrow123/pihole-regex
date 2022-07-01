#!/bin/bash

clear

# Create myScripts directory if not exist.
if [ ! -d "$HOME/myScripts" ]; then
    mkdir -p "$HOME/myScripts"
    clear
fi

# Change working directory to "$HOME/myScripts"
pushd "$HOME/myScripts"

# Make user input case insensitive
shopt -s nocasematch

# Get the user's input
echo -e "Install script for SlyFox1186's Exact whitelist filters\\n\\nPlease choose an option: [A]dd or [R]emove: "
read a
if [[ $a == "A" ]]; then
    clear
    echo -e "Adding custom Exact whitelist filters to Pi-hole.\\n"
    sleep 3
    curl -sSl 'https://raw.githubusercontent.com/slyfox1186/pihole.regex/main/scripts/install-exact-whitelist.py' | sudo python3
else
    clear
    echo -e "Removing custom Exact whitelist filters from Pi-hole.\\n"
    sleep 3
    curl -sSl 'https://raw.githubusercontent.com/slyfox1186/pihole.regex/main/scripts/uninstall-exact-whitelist.py' | sudo python3
fi

# CHANGE WORKING DIRECTORY TO THE USER'S "$HOME"
pushd "$HOME"

# DELETE THE TEMP DIRECTORY "$HOME/myScripts"
if [ -d "$HOME/myScripts" ]; then
    rm -R "$HOME/myScripts"
fi

# PRINT DIRECTORY LIST
clear; ls -1A --color
