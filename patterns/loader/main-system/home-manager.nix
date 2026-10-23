# Edit this file to add or remove users from home-manager.
{...}: {
  imports = [
    ./users/home-manager/default.nix
  ];

  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = false;
}
