# Installs veracrypt
{pkgs, ...}: {
  # Packages
  environment.systemPackages = with pkgs; [
    veracrypt # Manipulate veracrypt volumes.
  ];
}
