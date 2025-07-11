# 🎵 YouTube Music Downloader Script

Simple scripts to download audio from **YouTube Music playlists or videos** using [`yt-dlp`](https://github.com/yt-dlp/yt-dlp).
Supports various audio formats, playlist folders, and cookie authentication for private playlists.

---

## ✅ Features

* Download playlists or single videos
* Extract audio in **Opus**, **MP3**, **ALAC**, **FLAC**, **WAV**, and more
* Embed thumbnails and metadata into your audio files
* Automatically organize downloads into subfolders
* Works with private playlists using `cookies.txt`
* Available for **Windows (PowerShell)** and **Linux (Bash)**

---

## 🔧 Prerequisites

### **yt-dlp & FFmpeg Installation**

| OS / Distro                                 | yt-dlp                                                                                                         | FFmpeg                                                              |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| **Arch Linux / Manjaro / EndeavourOS**      | `sudo pacman -S yt-dlp`                                                                                        | `sudo pacman -S ffmpeg`                                             |
| **Debian / Ubuntu / Linux Mint / Pop!\_OS** | `sudo apt install yt-dlp`                                                                                      | `sudo apt install ffmpeg`                                           |
| **Fedora**                                  | `sudo dnf install yt-dlp`                                                                                      | `sudo dnf install ffmpeg`                                           |
| **openSUSE**                                | `sudo zypper install yt-dlp`                                                                                   | `sudo zypper install ffmpeg`                                        |
| **Windows**                                 | [Download yt-dlp](https://github.com/yt-dlp/yt-dlp#installation)                                               | [Download FFmpeg](https://ffmpeg.org/download.html)                 |
| *(Others)*                                  | Use your distro’s package manager or [see yt-dlp install guide](https://github.com/yt-dlp/yt-dlp#installation) | [See ffmpeg.org for instructions](https://ffmpeg.org/download.html) |

> ⚠️ Make sure both `yt-dlp` and `ffmpeg` are available in your **PATH**.

---

## 🍪 Cookies.txt (optional, for private playlists)

If you want to download from **your account** (private playlists, liked songs, etc.):

1. Install the **Get cookies.txt** browser extension:

   * [Chrome](https://chrome.google.com/webstore/detail/get-cookiestxt/lijhoplpmkdphhdogognogojjphklgha)
   * [Firefox](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/)
2. Export your YouTube cookies and save them as `cookies.txt`.
3. When the script asks if you want to use cookies, type **Y** and paste the **full path** to the file.
   Examples:
   **Windows:** `C:\Users\YourName\Downloads\cookies.txt`
   **Linux:** `/home/username/Downloads/cookies.txt`

If you skip this step, the script will only download **public playlists**.

---

## ▶️ How to Use

### **Windows PowerShell**

1. Open PowerShell in the folder with the script.
2. Run:

   ```powershell
   .\ytmusic-dl.ps1
   ```

---

### **Linux Bash**

1. Open a terminal or right-click → "Run in Terminal" in the folder with the script.
2. Make the script executable (first time only):

   ```bash
   chmod +x ytmusic-dl.sh
   ```
3. Run:

   ```bash
   ./ytmusic-dl.sh
   ```

---

## 🛠 Example Features

* Save audio as **Opus** with the best quality
* Embed album art & song metadata
* Organize files in folders named after the playlist

---

## 🔜 Planned Improvements

* GUI version
* Auto-update yt-dlp
* Save default options in a config file
* Linux desktop launcher (`.desktop` file)
