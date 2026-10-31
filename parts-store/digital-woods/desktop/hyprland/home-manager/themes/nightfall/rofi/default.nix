{pkgs, ...}: {
  home.file = {
    ".config/rofi/theme.rasi" = {
      source = ./theme.rasi;
      recursive = true;
    };
  };
}
