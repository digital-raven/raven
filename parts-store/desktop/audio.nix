# Audio management.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pavucontrol # Graphical audio configuration.
  ];
}
