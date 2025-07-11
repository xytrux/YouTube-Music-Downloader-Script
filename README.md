# YouTube Music Downloader Script

Scripts for downloading audio from **YouTube Music playlists or videos** using [`yt-dlp`](https://github.com/yt-dlp/yt-dlp).
Supports various audio formats and can organize downloads into subfolders automatically.

---

## ✅ Features

* Download from playlists or individual videos
* Extract audio in multiple formats (`opus`, `mp3`, `alac`, `flac`, `wav`, etc.)
* Embed metadata and thumbnails
* Optional subfolders named after the playlist or video
* Works on **Windows (PowerShell)** and **Linux (Bash)**
* Supports cookie authentication for private playlists (`cookies.txt`)

---

## 🔧 Prerequisites

### Windows (PowerShell)

1. **yt-dlp**

   * [Install yt-dlp](https://github.com/yt-dlp/yt-dlp#installation)
   * Add `yt-dlp.exe` to your system’s PATH

2. **FFmpeg**

   * Download from [ffmpeg.org](https://ffmpeg.org/)
   * Add `ffmpeg.exe` to your system’s PATH

3. PowerShell 5.0 or later

---

### Linux (Bash)

1. **yt-dlp & ffmpeg**

   ```bash
   sudo pacman -S yt-dlp ffmpeg   # Arch Linux
   ```

   (or use your distro's package manager)

2. Make sure `yt-dlp` and `ffmpeg` are in your PATH.

---

## ▶️ Usage

### Windows

1. Open PowerShell and navigate to the directory containing the script.
2. Run:

   ```powershell
   .\ytmusic-dl.ps1
   ```

---

### Linux

1. Open a terminal or run the script from your file manager.
2. Navigate to the directory containing the script.
3. Make it executable:

   ```bash
   chmod +x ytmusic-dl.sh
   ```
4. Run:

   ```bash
   ./ytmusic-dl.sh
   ```

   Or pass the playlist URL directly:

   ```bash
   ./ytmusic-dl.sh "https://music.youtube.com/playlist?list=..."
   ```

---

## 🍪 Cookies (optional)

If you want to download private playlists or avoid login restrictions:

1. Export your YouTube cookies as `cookies.txt`.
2. Place the file in your home directory or the same folder as the script.
3. The script already points to `/home/arm/cookies.txt`. Change the path inside the script if needed.

---

## 🔜 Planned Improvements

* GUI version
* Auto-update yt-dlp
* `.desktop` launcher (Linux)
* Config file for defaults
