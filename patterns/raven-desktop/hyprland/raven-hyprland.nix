# This file contains system-level, raven-specific tweaks to a
# base hyprland experience.
#
# hyprland.nix should be a usable, but basic, hyprland environment
# even without this file.
#
# But this file helps makes it nicer and ticks the boxes for
# Lock, logout, idle, status-bar, notification-daemon, and
# a couple of plugins.
{
  pkgs,
  lib,
  ...
}: {

  # Required packages for base hyprland
  environment.systemPackages = with pkgs; [

    kdePackages.dolphin

    # Brightness and Volume Control
    brightnessctl

    ## Lock, logout, and idle
    hyprlock
    wlogout

    ## Desktop tools
    grimblast # Screenshot
    hyprpicker # Color picker

    ## Waybar and notifications
    waybar
    dunst

    ## Plugins
    hyprlandPlugins.hypr-dynamic-cursors
    hyprlandPlugins.hyprspace

    # Other tools
    pulseaudio
    pamixer
    fzf
  ];

  ## Allow Chromium and Electron applications to run without Xwayland.
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  # For waybar.
  services.playerctld.enable = true;

  # simple-hyprland calls out these fonts, and https://wiki.nixos.org/wiki/Fonts
  # says this is how you install all nerd fonts and IDK how to exactly port his list.
  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # also mecha waybar
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };
}
