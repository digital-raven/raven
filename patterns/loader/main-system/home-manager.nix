{...}: {
  imports = [
    ./users/home-manager
  ];

  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = false;
}
