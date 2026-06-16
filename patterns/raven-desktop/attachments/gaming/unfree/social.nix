# Gaming-oriented social packages.
{pkgs, ...}: {
  # Packages
  environment.systemPackages = with pkgs; [
    betterdiscordctl
    discord
  ];
}
