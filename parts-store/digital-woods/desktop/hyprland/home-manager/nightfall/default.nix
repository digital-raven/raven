# Nightfall is Raven's provided hyprland theme.
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
    ./rofi/default.nix
    ./swww/default.nix
    ./waybar/default.nix
    ./wlogout/default.nix
  ];
}
