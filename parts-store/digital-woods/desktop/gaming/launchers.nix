{pkgs, ...}: {
  # Packages
  environment.systemPackages = with pkgs; [
    atlauncher # Minecraft launcher.
    heroic # Epic Store, GoG, and Prime Gaming.
  ];

  # You can get a Steam Deck-like experience as well.
  # https://wiki.nixos.org/wiki/Heroic_Games_Launcher
  #
  #(heroic.override {
  #  extraPkgs = pkgs: [
  #    pkgs.gamescope
  #  ];
  #})
}
