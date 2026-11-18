{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    heroic # Epic Store, GoG, and Prime Gaming.
  ];

  # I heard a rumor you can get a Steam Deck-like experience
  # as well. Not verified.
  #
  # https://wiki.nixos.org/wiki/Heroic_Games_Launcher
  #
  #(heroic.override {
  #  extraPkgs = pkgs: [
  #    pkgs.gamescope
  #  ];
  #})
}
