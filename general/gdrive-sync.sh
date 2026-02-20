#!/bin/zsh

rclone sync /home/$USER/Documents gdrive:thinkpad-backup/Documents
rclone sync /home/$USER/Pictures gdrive:thinkpad-backup/Pictures
rclone sync /home/$USER/University gdrive:thinkpad-backup/University
rclone sync /home/$USER/ObsidianVault gdrive:thinkpad-backup/Obsidian
