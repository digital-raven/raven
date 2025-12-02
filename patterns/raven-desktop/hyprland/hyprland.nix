# This file illustrates what is required for hyprland to work
# and be usable at the system-level.
#
# It configures a display manager to start automatically, configures
# portals and polkits in a minimal fashion at the system level, and
# establishes hyprland with a few pre-selected high-quality plugins
# which should allow clear intuition about how to add new plugins
# to your Raven system.
#
# If you were trying to set up hyprland on NixOS from scratch,
# I, the author, currently believe this is "the best you can do".
# I have tried alternative methods with different polkits and other
# popular hyprland-based flakes, and this setup has so far proven
# the most stable. I hope it provides a clear showing of required foundation
# for a hyprland user experience capable of media production, programming,
# gaming, and personal data management.
#
# Thank you, to simple-hyprland, for delivering a portal and polkit
# structure that works in a Nix-flake developed generically from the
# ground up.
#
# https://github.com/gaurav23b/simple-hyprland/blob/main/docs/installation_Hypr.md
#
# This file is organized as
#
#   System level -> Desktop level (Hyprland) -> Application level
#
# I hope that description helps show when these elements become relevant
# with respect to your system's boot-to-usage sequence.
{
  pkgs,
  lib,
  ...
}: {
  # Required packages for base hyprland
  environment.systemPackages = with pkgs; [
    # Generic desktop requirements
    kdePackages.polkit-kde-agent-1

    # Core Hyprland utilities
    hyprland-qt-support
  ];

  # Foundations
  # Display server and login screen.
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  hardware.graphics.enable = true;

  # Portals and polkits
  # simple-hyprland does it this way.
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    configPackages = [pkgs.hyprland];
  };

  security = {
    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if ( subject.isInGroup("users") && (
           action.id == "org.freedesktop.login1.reboot" ||
           action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
           action.id == "org.freedesktop.login1.power-off" ||
           action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          ))
          { return polkit.Result.YES; }
        })
      '';
    };
  };

  # Hyprland time.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
