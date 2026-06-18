# Bring in all home-manager paths by default.
{...}: {
  imports = [
    ./hyprland/home-manager/default.nix
  ];
}
