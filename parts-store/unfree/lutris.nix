# https://wiki.nixos.org/wiki/Lutris
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lutris # Great FOSS launcher.
  ];
}
