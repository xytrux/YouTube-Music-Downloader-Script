#!/bin/bash

# Check if the playlist URL was passed as an argument
url="$1"

# Prompt for base directory (default: script directory)
read -p "Enter the full path to the directory where you want to save the downloads (Press Enter to use the script's directory): " baseDir
[ -z "$baseDir" ] && baseDir="$(dirname "$(realpath "$0")")"
[ ! -d "$baseDir" ] && mkdir -p "$baseDir"

# Ask for the playlist URL if it wasn't passed
if [ -z "$url" ]; then
    read -p "Enter YouTube Music playlist URL or search query: " url
fi

# Ask if the user wants a subfolder
read -p "Do you want to create a folder named after the playlist/video? (Y/N): " makeSubfolder

# Ask for the audio format
read -p "Enter the desired audio format (e.g., mp3, alac, flac, wav, etc.) [Default: opus]: " audioFormat
[ -z "$audioFormat" ] && audioFormat="opus"

# Get playlist/video title if subfolder is requested
if [[ "$makeSubfolder" =~ ^[Yy] ]]; then
    echo "Fetching playlist/video title from yt-dlp..."
    title=$(yt-dlp --cookies /home/arm/cookies.txt --flat-playlist --print "%(playlist_title)s" "$url" 2>/dev/null | head -n 1)
    [ -z "$title" ] && title=$(yt-dlp --cookies /home/arm/cookies.txt --print "%(title)s" "$url" 2>/dev/null | head -n 1)
    [ -z "$title" ] && title="Untitled"
    folderName=$(echo "$title" | tr -d '\\/:*?"<>|')
    outputFolder="$baseDir/$folderName"
    mkdir -p "$outputFolder"
else
    outputFolder="$baseDir"
fi

# Set the output template
outputTemplate="${outputFolder}/%(artist)s - %(title)s.%(ext)s"

# Run yt-dlp
yt-dlp \
    --extract-audio \
    --audio-format "$audioFormat" \
    --audio-quality 0 \
    --embed-thumbnail \
    --add-metadata \
    --sleep-interval 5 \
    --max-sleep-interval 5 \
    --cookies /home/arm/cookies.txt \
    -o "$outputTemplate" \
    "$url"
