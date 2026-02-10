#!/bin/bash

# This script is used on my laptop and backs up key directories to my homelab so I have a backup working there at all times
# I don't backup my projects directory directly as I use version control for that
# If you want backup of other directories, simply copy the following line and make the appropriate changes:
# rsync -az --delete --quiet -e ssh ~/path/of/directory/to/backup/ $USER@$HOST:/path/to/backup/directory/on/remote/

# VARIABLES
USER="user"
HOST="host"

#TODO: Get automation working

# Auto backup Obsidian vault
rsync -az --delete -e ssh ~/ObsidianVault/ "$USER"@"$HOST":/data_128g/backups/obsidian_vault/

# Auto backup documents directory
rsync -az --delete -e ssh ~/Documents/ "$USER"@"$HOST":/data_128g/backups/strider_documents/

# Auto backup university directory
rsync -az --delete -e ssh ~/University/ "$USER"@"$HOST":/data_128g/backups/university/

# Auto backup picture directory
rsync -az --delete -e ssh ~/Pictures/ "$USER"@"$HOST":/data_128g/backups/strider_pictures/
