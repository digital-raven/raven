# OBS-Studio has plugins available.
#
{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      # obs-studio-plugins.wlrobs
    ];
  };
}
