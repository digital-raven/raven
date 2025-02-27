# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
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
    ./nvidia.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };

    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };


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
