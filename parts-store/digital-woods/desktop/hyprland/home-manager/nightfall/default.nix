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
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./rofi.nix
    ./swww.nix
    ./waybar.nix
    ./wlogout.nix
  ];
}
