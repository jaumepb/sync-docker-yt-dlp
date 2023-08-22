# docker-yt-dlp

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/jaumepb/sync-docker-yt-dlp/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/jaumepb/sync-docker-yt-dlp/tree/main)

Altra badge
[![CircleCI](https://dl.circleci.com/insights-snapshot/gh/jaumepb/sync-docker-yt-dlp/main/build-deploy/badge.svg?window=30d)](https://app.circleci.com/insights/github/jaumepb/sync-docker-yt-dlp/workflows/build-deploy/overview?branch=main&reporting-window=last-30-days&insights-snapshot=true)

This image is automatically build with the latest version of **yt-dlp** (https://github.com/yt-dlp/yt-dlp)

## Alias to download a Single Video, entry or Playlist in mp3 format:

You can put this into the .bashrc for example if you're using linux:

```sh
alias dyt-dlp_mp3='docker pull jaume/yt-dlp:latest; docker run --user $UID:$GID --rm -v "$(pwd)":/download jaume/yt-dlp -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --extract-audio --audio-format mp3 --audio-quality 0 '
```

Then you can run:
```
dyt-dlp_mp3 "<Youtube URL>"
```

## Download all playlists of YouTube channel/user keeping each playlist in separate directory:

```sh
alias dyt-dlp_video='docker pull jaume/yt-dlp:latest; docker run --user $UID:$GID --rm -v "$(pwd)":/download jaume/yt-dlp -o "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" '
```

Then you can run:
```
dyt-dlp_video "<Youtube URL>"
```
