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

  # If you want to use modules your own flake exports (from shared/modules):
  # outputs.nixosModules.example
  imports = [
    # hardware-configuration.nix is brought to the system via flake.nix

    # System-wide packages
    ./system-packages.nix

    # Choose specific drivers.
    #./drivers/nvidia-open.nix

    # Users
    ./users.nix
  ];

  # Bootloader. Copy the lines that start with "boot." from /etc/nixos/configuration.nix
  # REPLACEME_boot

  # Networking
  networking.hostName = "REPLACEME_hostName";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "REPLACEME_timeZone";

  # Select internationalisation properties.
  i18n.defaultLocale = "REPLACEME_defaultLocale";

  # Optional extraLocaleSettings. https://nixos.wiki/wiki/Locales
  #i18n.extraLocaleSettings = {
  #};

  # Docker
  virtualisation.docker.enable = true;

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
