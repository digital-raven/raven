# Commandline version of rar. Non-free license.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    rar # Manipulate .rar archives.
  ];
}
