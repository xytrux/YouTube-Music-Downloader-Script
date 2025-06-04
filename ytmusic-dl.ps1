# Default to the current directory of the script
$baseDir = Read-Host "Enter the full path to the directory where you want to save the downloads (Press Enter to use the script's directory)"
if (-not $baseDir) {
    $baseDir = $PSScriptRoot
}

# Validate or create the base directory
if (-not (Test-Path $baseDir)) {
    New-Item -ItemType Directory -Path $baseDir | Out-Null
}

# Ask for the playlist URL or search query
$url = Read-Host "Enter YouTube Music playlist URL or search query"

# Ask if user wants a subfolder
$makeSubfolder = Read-Host "Do you want to create a folder named after the playlist/video? (Y/N)"

# Ask for the desired audio format
$audioFormat = Read-Host "Enter the desired audio format (e.g., mp3, alac, flac, wav, etc.)"
if (-not $audioFormat) {
    $audioFormat = "alac" # Default to ALAC if no input is provided
}

# Get title from yt-dlp
if ($makeSubfolder -match '^[Yy]') {
    Write-Host "Fetching playlist/video title from yt-dlp..."
    try {
        $title = yt-dlp --flat-playlist --print "%(playlist_title)s" "$url" 2>$null | Select-Object -First 1
        if (-not $title) {
            $title = yt-dlp --print "%(title)s" "$url" 2>$null | Select-Object -First 1
        }

        # Fallback if still empty
        if (-not $title) {
            $title = "Untitled"
        }

        # Sanitize folder name (remove invalid chars)
        $folderName = ($title -replace '[\\/:*?"<>|]', '').Trim()
        $outputFolder = Join-Path $baseDir $folderName
        if (-not (Test-Path $outputFolder)) {
            New-Item -ItemType Directory -Path $outputFolder | Out-Null
        }
    } catch {
        Write-Host "Failed to get playlist title. Using base directory instead."
        $outputFolder = $baseDir
    }
} else {
    $outputFolder = $baseDir
}

# Set output filename pattern
$outputTemplate = "$outputFolder\%(artist)s - %(title)s.%(ext)s"

# Run yt-dlp with all features
yt-dlp `
    -x `
    --audio-format $audioFormat `
    --audio-quality 0 `
    --embed-metadata `
    --embed-thumbnail `
    --add-metadata `
    -o $outputTemplate `
    "$url"
