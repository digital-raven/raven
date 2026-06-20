# Tools for command-line media manipulation.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cmus # Music player
    ffmpeg # Powerful video and audio editor.
    yt-dlp # Download videos from YouTube. YMMV.
  ];
}
