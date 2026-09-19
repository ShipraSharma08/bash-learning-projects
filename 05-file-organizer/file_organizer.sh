#!/bin/bash
echo "===== File Organizer ====="
read -p "Enter folder to organize: " target_dir
if [ ! -d "$target_dir" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi
mkdir -p "$target_dir/Images"
mkdir -p "$target_dir/Documents"
mkdir -p "$target_dir/Videos"
mkdir -p "$target_dir/Audio"
mkdir -p "$target_dir/Others"
for file in "$target_dir"/*
do
if [ -f "$file" ]; then
filename=$(basename "$file")
extension="${filename##*.}"
case "$extension" in
    jpg|jpeg|png|gif)
        category="Images"
        ;;
    pdf|doc|docx|txt)
        category="Documents"
        ;;
    mp4|mkv|avi)
        category="Videos"
        ;;
    mp3|wav)
        category="Audio"
        ;;
    *)
        category="Others"
        ;;
esac
mv "$file" "$target_dir/$category/$filename"
fi
done
echo "Files organized successfully!"
