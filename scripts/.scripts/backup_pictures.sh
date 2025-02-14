#! /bin/bash
source_directory="$HOME/Pictures/"
destination_directory="/mnt/pictures_backup"

rsync -avz "$source_directory" "$destination_directory"

echo "Picture backup completed."


