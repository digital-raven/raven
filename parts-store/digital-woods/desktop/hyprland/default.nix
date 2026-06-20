# Bare-minimum system-level hyprland from scratch.
#
# Hyprland's default launcher for kitty is SUPER ("Windows") + Q.
#
# https://wiki.nixos.org/wiki/Hyprland
#
# All subsequent modifications are kept under home-manager.
#
{
  pkgs,
  lib,
  ...
}: {
  hardware.graphics.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  # NixOS hyprland module
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true; # recommended for most users
  };

  # Portals and polkits
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  security.polkit.enable = true;

  # System packages.
  environment.systemPackages = with pkgs; [
    kitty # Needed for default hyprland configuration.
    wl-clipboard # Allows pass -c to work.

    # themes are usually opinionated on these 2 programs, but default
    # hyprland calls them out.
    #
    #kdePackages.dolphin # hyprland's default config uses this file-explorer.
    #playerctl # hyprland's default config uses this.
  ];

  # Install all nerd fonts. https://wiki.nixos.org/wiki/Fonts
  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # Hint Electron apps to use Wayland
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };
}
