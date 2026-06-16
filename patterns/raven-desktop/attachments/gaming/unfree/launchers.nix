{pkgs, ...}: {
  # Install steam
  programs.steam = {
    enable = true;
  };

  # You can have your computer behave like a Steam Deck if you wish.
  # https://nixos.wiki/wiki/Steam
  #
  #programs.gamescope.enable = true;
  #programs.gamemode.enable = true;
}
