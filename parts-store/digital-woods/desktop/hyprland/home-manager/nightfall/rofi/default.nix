{pkgs, ...}: {
  programs.rofi.enable = true;

  home.file = {
    ".config/rofi/deathemonic" = {
      source = ./deathemonic;
      recursive = true;
    };
  };
}
