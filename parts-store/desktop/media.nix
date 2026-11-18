# Great applications.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    easytag # Edit mp3 metadata.
    eog # Straightforward photo viewer.
    gimp # FOSS answer to Photoshop.
    #krita # Drawing software advertised toward the talented.
    pinta # Closer to paint.net than MS paint.
    qbittorrent # Torrent client
    vlc # Best video player
  ];
}
