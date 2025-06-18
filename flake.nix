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
    #
    # Install one with one of the following commands.
    #
    # ```
    # nixos-rebuild --flake .#raven-home
    # nixos-rebuild --flake .#raven-gaming
    # nixos-rebuild --flake .#raven-terminal
    # ```
    nixosConfigurations = {
      raven-home = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./host/hardware-configuration.nix
          ./shared/shared-enable.nix
          ./host/configuration.nix
          home-manager.nixosModules.home-manager {
            imports = [ ./host/home-manager ];
          }
          ./patterns/raven-home/default.nix
          ./patterns/raven-terminal/default.nix
        ];
      };
      raven-gaming = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./host/hardware-configuration.nix
          ./shared/shared-enable.nix
          ./host/configuration.nix
          home-manager.nixosModules.home-manager {
            imports = [ ./host/home-manager ];
          }
          ./patterns/raven-gaming/default.nix
          ./patterns/raven-terminal/default.nix
          ./patterns/raven-home/default.nix
        ];
      };
      raven-terminal = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./host/hardware-configuration.nix
          ./shared/shared-enable.nix
          ./host/configuration.nix
          home-manager.nixosModules.home-manager {
            imports = [ ./host/home-manager ];
          }
          ./patterns/raven-terminal/default.nix
        ];
      };
    };
  };
}
