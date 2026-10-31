# Kitty config. See https://sw.kovidgoyal.net/kitty/conf.html
# and https://mynixos.com/home-manager/options/programs.kitty
#
{...}: {
  home.file = {
    ".config/kitty/Polaris.conf" = {
      source = ./Polaris.conf;
    };
  };

  programs.kitty = {
    enable = true;

    extraConfig = ''
      include Polaris.conf
    '';
  };
}
