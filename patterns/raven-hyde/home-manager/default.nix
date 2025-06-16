{
  inputs,
  ...
}:
let
  # Package declaration
  # ---------------------

  pkgs = import inputs.hydenix.inputs.hydenix-nixpkgs {
    inherit (inputs.hydenix.lib) system;
    config.allowUnfree = true;
    overlays = [
      inputs.hydenix.lib.overlays
      (final: prev: {
        userPkgs = import inputs.nixpkgs {
          config.allowUnfree = true;
        };
      })
    ];
  };

in
{

  imports = [
    inputs.hydenix.lib.homeModules
    # Nix-index-database - for comma and command-not-found
    inputs.nix-index-database.hmModules.nix-index
    ./hyde.nix
    ../../raven-terminal/home-manager/default.nix
  ];
}
