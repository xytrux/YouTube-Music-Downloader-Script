# Prompt for base directory
$baseDir = Read-Host "Enter the full path to the directory where you want to save the downloads (Press Enter to use the script's directory)"
if (-not $baseDir) { $baseDir = $PSScriptRoot }
if (-not (Test-Path $baseDir)) { New-Item -ItemType Directory -Path $baseDir | Out-Null }

# Playlist URL
$url = Read-Host "Enter YouTube Music playlist URL or search query"

# Subfolder?
$makeSubfolder = Read-Host "Do you want to create a folder named after the playlist/video? (Y/N)"

# Audio format
$audioFormat = Read-Host "Enter the desired audio format (e.g., mp3, alac, flac, wav, etc.)"
if (-not $audioFormat) { $audioFormat = "alac" }

# Ask for cookies
$useCookies = Read-Host "Do you want to use a cookies.txt file? (Y/N)"
if ($useCookies -match '^[Yy]') {
    $cookiesPath = Read-Host "Enter the full path to your cookies.txt file"
    $cookiesOption = "--cookies `"$cookiesPath`""
} else {
    $cookiesOption = ""
}

# Get playlist/video title
if ($makeSubfolder -match '^[Yy]') {
    Write-Host "Fetching playlist/video title from yt-dlp..."
    try {
        $title = yt-dlp --flat-playlist --print "%(playlist_title)s" $cookiesOption "$url" 2>$null | Select-Object -First 1
        if (-not $title) { $title = yt-dlp --print "%(title)s" $cookiesOption "$url" 2>$null | Select-Object -First 1 }
        if (-not $title) { $title = "Untitled" }
        $folderName = ($title -replace '[\\/:*?"<>|]', '').Trim()
        $outputFolder = Join-Path $baseDir $folderName
        if (-not (Test-Path $outputFolder)) { New-Item -ItemType Directory -Path $outputFolder | Out-Null }
    } catch {
        Write-Host "Failed to get playlist title. Using base directory instead."
        $outputFolder = $baseDir
    }
} else {
    $outputFolder = $baseDir
}

$outputTemplate = Join-Path $outputFolder "%(artist)s - %(title)s.%(ext)s"

# yt-dlp command
$ytDlpCommand = @(
    "--extract-audio",
    "--audio-format", $audioFormat,
    "--audio-quality", "0",
    "--embed-thumbnail",
    "--add-metadata",
    "--sleep-interval", "5",
    "--max-sleep-interval", "5",
    "-o", "`"$outputTemplate`""
)

# Add cookies if used
if ($cookiesOption) { $ytDlpCommand += $cookiesOption }
$ytDlpCommand += "`"$url`""

# Run yt-dlp
yt-dlp @ytDlpCommand
