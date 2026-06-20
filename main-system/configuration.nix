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

    # Apply pattern.
    ../patterns/REPLACEME_raven-pattern/default.nix

    # System-wide packages
    ./system-packages.nix

    # Choose specific drivers.
    #./drivers/amd.nix

    # Choose a disk profile if installing Raven to its own drive.
    #./disks/REPLACEME_disk_profile

    # Users
    ./users.nix
  ];

  # Bootloader
  # If you're installing Raven to a fresh disk, the following boot settings will
  # work with the provided disk profiles.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #
  # If you're instead installing Raven to an existing NixOS installation, then copy the
  # lines that start with "boot." from /etc/nixos/configuration.nix
  # REPLACEME_boot_settings

  # Name of this installation.
  networking.hostName = "REPLACEME_hostName";

  # Set your time zone.
  time.timeZone = "REPLACEME_timeZone";

  # Select internationalisation properties.
  i18n.defaultLocale = "REPLACEME_defaultLocale";

  # Optional. https://nixos.wiki/wiki/Locales
  #i18n.extraLocaleSettings = {
  #};

  # Raven provides unfree software, but not by default. Allowance
  # of unfree packages must be enabled manually.
  # Unfree files are explicitly placed in unfree directories.
  nixpkgs.config.allowUnfree = false;

  # Global NixOS settings.
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";

      # Disable global registry
      flake-registry = "";

      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };

    # Disable channels
    channel.enable = false;

    # Make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Don't ever change this.
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
