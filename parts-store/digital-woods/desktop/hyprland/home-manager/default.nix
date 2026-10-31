# Theme management is performed following Harness.
#
# Modify this file to select a theme.
#
{pkgs, ...}: {
  imports = [
    # Select themes here.
    #./themes/nightfall/default.nix
    ./themes/polaris/default.nix
    #./themes/stylix/default.nix

    # Harness Globals
    ./hyprland/default.nix
    ./hyprlock/default.nix
    ./kitty/default.nix
    ./ranger.nix
    ./rofi/default.nix
    ./waybar/default.nix
    ./wlogout/default.nix
  ];

  # Also a Harness Global
  services.swww.enable = true;
}
