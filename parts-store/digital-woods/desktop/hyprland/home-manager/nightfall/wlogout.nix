{...}: {
  programs.wlogout.enable = true;

  home.file = {
    ".config/wlogout" = {
      source = ./dotfiles/wlogout;
      recursive = true;
    };
  };
}
