# This is your system's configuration file.
# Use this to configure your system environment
# Replace the values as seen in /etc/nixos/configuration.nix

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  # If you want to use modules your own flake exports (from modules/nixos):
  # outputs.nixosModules.example

  # Or modules from other flakes (such as nixos-hardware):
  # inputs.hardware.nixosModules.common-cpu-amd
  # inputs.hardware.nixosModules.common-ssd

  # You can also split up your configuration and import pieces of it here:
  imports = [

    # hardware-configuration.nix is brought to the system via flake.nix

    # System-wide packages
    ./system-packages.nix

    # EDIT_ to choose a GPU driver.
    #./drivers/nvidia.nix

    # Users
    ./users/users.nix
  ];

  # Bootloader.
  # REPLACEME_boot: Copy the lines that start with "boot." from /etc/nixos/configuration.nix

  # Networking
  networking.hostName = "REPLACEME_hostName";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "REPLACEME_timeZone";

  # Select internationalisation properties.
  i18n.defaultLocale = "REPLACEME_defaultLocale";

  i18n.extraLocaleSettings = {
    # REPLACEME_extraLocaleSettings
  };

  # Docker
  virtualisation.docker.enable = true;

  # System Configuration

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "REPLACEME_system.stateVersion";

  ###
  # TODO: Overlays need to fit additions, modifications, and unstable-packages,
  # despite being in the "personal" zone.
  ###
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
      # Allow unfree packages. true / false
      allowUnfree = REPLACEME_allowUnfree;
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
}
