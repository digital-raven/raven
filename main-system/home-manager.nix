# Edit this file to add or remove users from home-manager.
{...}: {
  imports = [
    ./users/home-manager
  ];

  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = false;
}
