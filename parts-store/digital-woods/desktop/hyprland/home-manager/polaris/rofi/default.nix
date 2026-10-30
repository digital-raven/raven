{pkgs, ...}: {
  programs.rofi.enable = true;

  home.file = {
    ".config/rofi/nightfall" = {
      source = ./nightfall;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    imagemagick # Used by wallpaper selection.
  ];
}
