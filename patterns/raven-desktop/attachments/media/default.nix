# Basic software for viewing and editing media.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    easytag # Edit mp3 metadata.
    gimp # Comprehensive image editor.
    kdePackages.gwenview # Photo-viewer
    kdePackages.kolourpaint # Easy-to-use paint program
    obs-studio # Record and stream applications and games.
    qbittorrent # Torrent client
    vlc # Best video player
  ];
}
