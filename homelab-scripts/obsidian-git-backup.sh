#!/bin/bash

# This script is used on my homelab and uploads a backup of my Obsidian database to Git
# I use Codeberg for my repositories, but this scrip will work for any Git-based service

# TODO: Write variant that will log if backup fails (emails me?)

CURR_DATE=$(date + "%F")

cd /data_128g/backups/obsidian_vault || exit

git add .
git commit -m "Vault backup ($CURR_DATE)"
sleep 5

git push -u origin main

echo "Successfully backed up vault!"
