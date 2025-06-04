# YouTube Music Downloader Script

PowerShell script that allows you to download audio from YouTube Music playlists or videos using `yt-dlp`. It supports various audio formats and can organize downloads into subfolders.

## Prerequisites

1. Install [yt-dlp](https://github.com/yt-dlp/yt-dlp):
   - Follow the installation instructions on the yt-dlp GitHub page.
   - Ensure `yt-dlp` is available in your system's PATH.

2. Install [FFmpeg](https://ffmpeg.org/):
   - Required for audio extraction and format conversion.
   - Ensure `ffmpeg` is available in your system's PATH.

3. Use PowerShell 5.0 or later.

## Usage

1. Open PowerShell and navigate to the directory containing the script.

2. Run the script:
   ```powershell
   .\ytmusic-dl.ps1
