# Bring in all home-manager paths by default.
{...}: {
  imports = [
    ./hyprland/home-manager/default.nix
    ./web-browsers/home-manager/default.nix
  ];
}
