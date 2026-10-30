{pkgs, ...}: {
  programs.rofi.enable = true;

  home.file = {
    ".config/rofi/stylix" = {
      source = ./stylix;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    imagemagick # Used by wallpaper selection.
  ];
}
