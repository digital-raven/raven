# Harness Rofi expects a theme to provide a theme.rasi file
{pkgs, ...}: {
  programs.rofi.enable = true;

  home.file = {
    ".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    imagemagick # Used by wallpaper selection.
  ];
}
