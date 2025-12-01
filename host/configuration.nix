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
  # You can also split up your configuration and import pieces of it here:
  imports = [
    # hardware-configuration.nix is brought to the system via flake.nix

    # System-wide packages
    ./system-packages.nix

    # Choose specific drivers.
    #./drivers/nvidia-open.nix

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

  # Networking
  networking.hostName = "REPLACEME_hostName";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "REPLACEME_timeZone";

  # Select internationalisation properties.
  i18n.defaultLocale = "REPLACEME_defaultLocale";

  # Optional. https://nixos.wiki/wiki/Locales
  #i18n.extraLocaleSettings = {
  #};

  # Docker
  virtualisation.docker.enable = true;

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
