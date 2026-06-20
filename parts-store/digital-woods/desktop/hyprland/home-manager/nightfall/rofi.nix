{pkgs, ...}: {
  programs.rofi.enable = true;

  home.file = {
    ".config/rofi" = {
      source = ./dotfiles/rofi;
      recursive = true;
    };
  };
}
