# YouTube Music Downloader Script

Scripts for downloading audio from **YouTube Music playlists or videos** using `yt-dlp`.
Supports various audio formats, can organize downloads into subfolders, and optionally uses cookies for private playlists.

---

## ✅ Features

* Download entire playlists or single videos
* Save audio as `opus`, `mp3`, `alac`, `flac`, `wav`, and more
* Embed thumbnails and metadata in audio files
* Optionally create a folder for each playlist or video
* Works with private playlists using a **cookies.txt** file
* Runs on **Windows (PowerShell)** and **Linux (Bash)**

---

## 🔧 Prerequisites

* [`yt-dlp`](https://github.com/yt-dlp/yt-dlp#installation)
* [`ffmpeg`](https://ffmpeg.org/)

> **Linux:**
> Install on Arch Linux:
> `sudo pacman -S yt-dlp ffmpeg`

> **Windows:**
>
> * Add both `yt-dlp.exe` and `ffmpeg.exe` to your system’s **PATH**

---

## 🍪 Using Cookies.txt (optional, recommended for private playlists)

To download from your **YouTube Music account (private playlists, liked songs, etc.):**

1. Export your YouTube cookies using a browser extension like [Get cookies.txt](https://chrome.google.com/webstore/detail/get-cookiestxt/).
2. Save it anywhere as `cookies.txt`.
3. When running the script, it will **ask if you want to use a cookies file**:

   * If you answer **Y**, enter the full path to your `cookies.txt`.
   * Example:
     **Windows:** `C:\Users\YourName\Downloads\cookies.txt`
     **Linux:** `/home/yourname/Downloads/cookies.txt`

If you don't use a cookies file, the script will still work for public playlists.

---

## ▶️ How to Use

### Windows PowerShell

1. Open PowerShell in the folder containing the script.
2. Run:

   ```powershell
   .\ytmusic-dl.ps1
   ```

---

### Linux Bash

1. Open a terminal or right-click → "Run in Terminal" in the folder containing the script.
2. Make it executable (first time only):

   ```bash
   chmod +x ytmusic-dl.sh
   ```
3. Run:

   ```bash
   ./ytmusic-dl.sh
   ```

---

## 🛠 Example Features

* Extract audio in **Opus** format
* Add thumbnails and song info
* Automatically organize downloads into folders

---

## 🔜 Future Improvements

* GUI version
* Auto-update yt-dlp
* Save your default options in a config file
* Linux desktop shortcut
