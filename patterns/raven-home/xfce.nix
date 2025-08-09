{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      elementary-xfce-icon-theme
      foliate
      font-manager
      qalculate-gtk
      wmctrl
      xclip
      xcolor
      xcolor
      xdo
      xdotool
      xfce.catfish
      xfce.gigolo
      xfce.orage
      xfce.xfburn
      xfce.xfce4-appfinder
      xfce.xfce4-clipman-plugin
      xfce.xfce4-cpugraph-plugin
      xfce.xfce4-dict
      xfce.xfce4-fsguard-plugin
      xfce.xfce4-genmon-plugin
      xfce.xfce4-netload-plugin
      xfce.xfce4-panel
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-systemload-plugin
      xfce.xfce4-weather-plugin
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-xkb-plugin
      xfce.xfdashboard
      xorg.xev
      xsel
      xtitle
      xwinmosaic
      zuki-themes
    ];
  };

  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];

      displayManager = {
        defaultSession = "xfce";
        lightdm = {
          enable = true;
          greeters.slick = {
            enable = true;
            theme.name = "Zukitre-dark";
          };
        };
      };
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
  };
}
