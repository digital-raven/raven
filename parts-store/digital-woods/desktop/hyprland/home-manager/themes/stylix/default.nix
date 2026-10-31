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
    ./rofi/default.nix
    ./stylix.nix
    ./waybar/default.nix
  ];

  home.file = {
    ".config/Wallpapers" = {
      source = ./Wallpapers;
      recursive = true;
    };
  };
}
