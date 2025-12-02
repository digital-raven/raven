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

    ## Other tools motivated by Raven's hyprland home-manager.
    ## TODO: See if can remove.
    pamixer
    pulseaudio
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
}
