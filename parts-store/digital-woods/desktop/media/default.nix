# Basic software for viewing and editing media.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    easytag # Edit mp3 metadata.
    eog # Photo-viewer
    gimp # Comprehensive image editor.
    #krita # Drawing software
    obs-studio # Record and stream applications and games.
    pinta
    qbittorrent # Torrent client
    vlc # Best video player
  ];
}
