{
  description = "Raven's nix configuration";

  inputs = {
    # Nixpkgs. Replace the text with your system.stateVersion in /etc/nixos/configuration.nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'shared/overlays/default.nix'.

    # Home manager. Replace the text with your system.stateVersion in /etc/nixos/configuration.nix
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Raven uses disko for disk partitioning and the bootloader.
    disko.url = "github:nix-community/disko/v1.12.0";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # Hydenix and its nixpkgs - kept separate to avoid conflicts
    # Raven uses a fork of hydenix for custom internal edits.
    hydenix = {
      url = "github:digital-raven/hydenix";
    };

    # Nix-index-database - for comma and command-not-found
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./shared/pkgs nixpkgs.legacyPackages.${system});

    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./shared/overlays {inherit inputs;};

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./shared/modules;

    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./shared/home-manager;

    # Raven's NixOS patterns
    nixosConfigurations = {
      raven-home = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          inputs.disko.nixosModules.disko
          ./host/hardware-configuration.nix
          ./host/configuration.nix
          ./patterns/raven-minimal/default.nix
          ./patterns/raven-terminal/default.nix
          ./patterns/raven-home/default.nix
          ./shared/shared-enable.nix
          home-manager.nixosModules.home-manager
          {
            imports = [./host/home-manager];
          }
        ];
      };
      raven-gaming = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          inputs.disko.nixosModules.disko
          ./host/hardware-configuration.nix
          ./host/configuration.nix
          ./patterns/raven-minimal/default.nix
          ./patterns/raven-terminal/default.nix
          ./patterns/raven-home/default.nix
          ./patterns/raven-gaming/default.nix
          ./shared/shared-enable.nix
          home-manager.nixosModules.home-manager
          {
            imports = [./host/home-manager];
          }
        ];
      };
      raven-terminal = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          inputs.disko.nixosModules.disko
          ./host/hardware-configuration.nix
          ./host/configuration.nix
          ./patterns/raven-minimal/default.nix
          ./patterns/raven-terminal/default.nix
          ./shared/shared-enable.nix
          home-manager.nixosModules.home-manager
          {
            imports = [./host/home-manager];
          }
        ];
      };
      raven-minimal = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          inputs.disko.nixosModules.disko
          ./host/hardware-configuration.nix
          ./host/configuration.nix
          ./patterns/raven-minimal/default.nix
          home-manager.nixosModules.home-manager
          {
            imports = [./host/home-manager];
          }
        ];
      };
      raven-iso = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
          ./patterns/raven-iso/configuration.nix
        ];
      };
      raven-hyde = inputs.hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
        inherit (inputs.hydenix.lib) system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          inputs.disko.nixosModules.disko
          inputs.hydenix.inputs.home-manager.nixosModules.home-manager
          {
            imports = [./host/home-manager];
          }
          ./host/hardware-configuration.nix
          ./host/configuration.nix
          ./patterns/raven-minimal/packages.nix
          ./patterns/raven-terminal/packages.nix
          ./patterns/raven-gaming/default.nix
          ./patterns/raven-home/packages.nix
          ./patterns/raven-hyde/default.nix
        ];
      };
    };
  };
}
