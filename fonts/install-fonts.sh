#!/bin/bash

# Enable recursive search with globstar in Bash
shopt -s globstar nullglob

# 1. Create the destination directory if it doesn't exist and move the .ttf files
sudo mkdir -p /usr/local/share/fonts/custom
sudo cp **/*.ttf /usr/local/share/fonts/custom/

# 2. Adjust the permissions of the copied files
sudo chmod 644 /usr/local/share/fonts/custom/*.ttf

# 3. Update the system font cache
sudo fc-cache -fv