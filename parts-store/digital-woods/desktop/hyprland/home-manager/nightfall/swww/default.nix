{pkgs, ...}: {
  services.swww.enable = true;

  home.file = {
    "Wallpapers" = {
      source = ./Wallpapers;
      recursive = true;
    };
  };
}
