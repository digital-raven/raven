# Stylix lets stylix.nix drive all color choices.
#
# Terminal: kitty
# File explorer: nautilus
# Bar: waybar
# App launcher: rofi
# Wallpaper: swww
# Screenshot: grimblast
# Color picker: hyprpicker
# Misc: wlogout, hyprlock, hypridle
#
{pkgs, ...}: {
  imports = [
    ./hypridle.nix
    ./hyprland/default.nix
    ./hyprlock/default.nix
    ./kitty/default.nix
    ./ranger.nix
    ./rofi/default.nix
    ./stylix.nix
    ./swww/default.nix
    ./waybar/default.nix
    ./wlogout/default.nix
  ];
}
