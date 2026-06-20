{
  description = "The Raven Operating System";

  inputs = {
    # Custom forks for nixpkgs, home-manager, and disko.
    nixpkgs.url = "github:digital-raven/nixpkgs/nixos-25.05";

    # Home manager.
    home-manager.url = "github:digital-raven/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Disko handles disk partitioning.
    disko.url = "github:digital-raven/disko/v1.13.0";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "x86_64-linux"

      # If your system is one of these you can try Raven on it.
      #"aarch64-linux"
      #"i686-linux"
      #"aarch64-darwin"
      #"x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Raven's NixOS patterns
    nixosConfigurations = {
      main-system = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          inputs.disko.nixosModules.disko
          ./main-system/hardware-configuration.nix
          ./main-system/configuration.nix
          home-manager.nixosModules.home-manager
          {
            imports = [./main-system/home-manager];
          }
        ];
      };
      loader = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
          ./patterns/loader/configuration.nix
        ];
      };
    };
  };
}
