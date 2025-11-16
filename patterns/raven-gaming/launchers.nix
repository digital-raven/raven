{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    atlauncher # Minecraft launcher.
    heroic # Epic Store, GoG, and Prime Gaming.
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
  ];

  # From https://wiki.nixos.org/wiki/Heroic_Games_Launcher
  # Heroic has some optional dependencies, such as Gamescope and GameMode, that are not
  # included in the FHS environment wrapper. If you want to use any of these, you need
  # to override the Heroic derivation to pass extra packages.

  # For Gamescope and GameMode, you also need to enable these in your NixOS configuration.
  #programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  # Install steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
