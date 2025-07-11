#!/bin/bash

# Prompt for base directory
read -p "Enter the full path to the directory where you want to save the downloads (Press Enter to use the script's directory): " baseDir
[ -z "$baseDir" ] && baseDir="$(dirname "$(realpath "$0")")"
[ ! -d "$baseDir" ] && mkdir -p "$baseDir"

# Playlist URL or search query
read -p "Enter YouTube Music playlist URL or search query: " url

# Ask if subfolder should be created
read -p "Do you want to create a folder named after the playlist/video? (Y/N): " makeSubfolder

# Ask for audio format
read -p "Enter the desired audio format (e.g., mp3, alac, flac, wav, etc.) [Default: opus]: " audioFormat
[ -z "$audioFormat" ] && audioFormat="opus"

# Ask about cookies
read -p "Do you want to use a cookies.txt file? (Y/N): " useCookies
if [[ "$useCookies" =~ ^[Yy] ]]; then
    read -p "Enter the full path to your cookies.txt file: " cookiesPath
    cookiesArg="--cookies \"$cookiesPath\""
else
    cookiesArg=""
fi

# Get playlist/video title
if [[ "$makeSubfolder" =~ ^[Yy] ]]; then
    echo "Fetching playlist/video title from yt-dlp..."
    title=$(yt-dlp $cookiesArg --flat-playlist --print "%(playlist_title)s" "$url" 2>/dev/null | head -n 1)
    [ -z "$title" ] && title=$(yt-dlp $cookiesArg --print "%(title)s" "$url" 2>/dev/null | head -n 1)
    [ -z "$title" ] && title="Untitled"
    folderName=$(echo "$title" | tr -d '\\/:*?"<>|')
    outputFolder="$baseDir/$folderName"
    mkdir -p "$outputFolder"
else
    outputFolder="$baseDir"
fi

outputTemplate="${outputFolder}/%(artist)s - %(title)s.%(ext)s"

# Run yt-dlp
eval yt-dlp \
    --extract-audio \
    --audio-format "$audioFormat" \
    --audio-quality 0 \
    --embed-thumbnail \
    --add-metadata \
    --sleep-interval 5 \
    --max-sleep-interval 5 \
    $cookiesArg \
    -o "\"$outputTemplate\"" \
    "\"$url\""
