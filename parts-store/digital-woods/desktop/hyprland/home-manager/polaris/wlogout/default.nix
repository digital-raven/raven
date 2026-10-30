{...}: {
  programs.wlogout.enable = true;

  home.file = {
    ".config/wlogout" = {
      source = ./wlogout;
      recursive = true;
    };
  };
}
