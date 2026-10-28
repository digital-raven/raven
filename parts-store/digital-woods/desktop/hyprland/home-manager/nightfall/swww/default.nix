{pkgs, ...}: {
  services.swww.enable = true;

  home.file = {
    ".config/Wallpapers" = {
      source = ./Wallpapers;
      recursive = true;
    };
  };
}
