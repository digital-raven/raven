# Unfree file tools.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    rar # Manipulate .rar archives.
  ];
}
