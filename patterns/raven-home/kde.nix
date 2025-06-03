# KDE specifc packages and configuration.
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

  # Enable the KDE Plasma Desktop Environment.
  services = {
    desktopManager.plasma6.enable = true;

    displayManager.sddm.enable = true;

    displayManager.sddm.wayland.enable = true;

    # Allows choice on login between wayland and X11.
    xserver = {
      enable = true;

      # Configure keymap in X11
      # TODO: Allow customization of xkb.layout.
      xkb.layout = "us";
      xkb.variant = "";
    };

    # Uncomment to allow remoting into your desktop. Requires x11.
    #xrdp = {
    #  defaultWindowManager = "startplasma-x11";
    #  enable = true;
    #  openFirewall = true;
    #};
  };

  environment.systemPackages = with pkgs; [
    #kdePackages.discover # Optional: Install if you use Flatpak or fwupd firmware update sevice
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
    kdePackages.partitionmanager # Manage the disk devices, partitions and file systems on your computer
    hardinfo2 # System information and benchmarks for Linux systems
    wayland-utils # Wayland utilities

    # Allows pass -c to function.
    wl-clipboard # Command-line copy/paste utilities for Wayland
    xclip # See wl-clipboard, but for x11.
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole  # Raven uses Kitty
  ];
}
