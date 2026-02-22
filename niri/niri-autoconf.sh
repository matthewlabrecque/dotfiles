#!/bin/bash

# This script is used to automatically install/configure Niri with Rofi and Waybar
sudo dnf instal niri waybar rofi-wayland swww --exclude=alacritty --exclude=fuzzel

# Copy the Niri config file
mkdir -p /home/"$USER"/.config/niri
cp config.kdl /home/"$USER"/.config/niri/

# Copy the Waybar configuration files
mkdir -p /home/"$USER"/.config/waybar
cp waybar/* /home/"$USER"/.config/waybar
