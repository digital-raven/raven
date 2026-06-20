{...}: {
  services.hypridle.enable = true;

  # Copy over dotfiles
  home.file = {
    ".config/hypr/hypridle.conf" = {
      source = ./dotfiles/hypridle/hypridle.conf;
    };
  };
}
