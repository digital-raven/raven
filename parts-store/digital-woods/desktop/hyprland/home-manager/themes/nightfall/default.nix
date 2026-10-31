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
