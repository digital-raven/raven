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
    ./emulators.nix
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    discord
    heroic
  ];

  # From https://wiki.nixos.org/wiki/Heroic_Games_Launcher
  # Heroic has some optional dependencies, such as Gamescope and GameMode, that are not
  # included in the FHS environment wrapper. If you want to use any of these, you need
  # to override the Heroic derivation to pass extra packages.

  #(heroic.override {
  #  extraPkgs = pkgs: [
  #    pkgs.gamescope
  #  ];
  #})

  # For Gamescope and GameMode, you also need to enable these in your NixOS configuration.
  #programs.gamescope.enable = true;
  #programs.gamemode.enable = true;

  # Install steam
  programs.steam = {
    enable = true;
  };
}
