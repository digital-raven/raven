{
  description = "Raven's nix configuration";

  inputs = {
    # Nixpkgs. Replace the text with your system.stateVersion in /etc/nixos/configuration.nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-REPLACEME_system.stateVersion";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager. Replace the text with your system.stateVersion in /etc/nixos/configuration.nix
    home-manager.url = "github:nix-community/home-manager/release-REPLACEME_system.stateVersion";
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
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
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
    nixosModules = import ./shared/modules/nixos;

    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./shared/modules/home-manager;

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
          ./host/configuration.nix
          ./patterns/raven-home/configuration.nix
          ./patterns/raven-terminal/configuration.nix
        ];
      };
      raven-gaming = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./host/configuration.nix
          ./patterns/raven-gaming/configuration.nix
          ./patterns/raven-terminal/configuration.nix
          ./patterns/raven-home/configuration.nix
        ];
      };
      raven-terminal = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./host/configuration.nix
          ./patterns/raven-terminal/configuration.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Install with the following command. Be sure to replace
    # with your userName and hostName.
    #
    # ```
    # home-manager --flake .#your-username@your-hostName'
    # ```
    homeConfigurations = {
      "master@REPLACEME_hostName" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main home-manager configuration file <
          ./shared/home-manager/home.nix
        ];
      };
    };
  };
}
