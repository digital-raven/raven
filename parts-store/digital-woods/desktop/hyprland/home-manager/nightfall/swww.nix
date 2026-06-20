{pkgs, ...}: {
  services.swww.enable = true;

  home.file = {
    "Wallpapers" = {
      source = ./dotfiles/swww;
      recursive = true;
    };
  };
}
