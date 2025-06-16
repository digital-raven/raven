{
  inputs,
  config,
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

  # Set pkgs for hydenix globally, any file that imports pkgs will use this
  nixpkgs.pkgs = pkgs;

  imports = [
    inputs.hydenix.lib.nixOsModules
  ];

  # IMPORTANT: Customize the following values to match your preferences
  hydenix = {
    enable = true; # Enable the Hydenix module

    gaming.enable = false; # enable gaming module
    boot.enable = false;
    /*
      Optionally edit the below values, or leave to use hydenix defaults
      visit ./modules/hm/default.nix for more options

      audio.enable = true; # enable audio module
      boot = {
        enable = true; # enable boot module
        useSystemdBoot = true; # disable for GRUB
        grubTheme = pkgs.hydenix.grub-retroboot; # or pkgs.hydenix.grub-pochita
        grubExtraConfig = ""; # additional GRUB configuration
        kernelPackages = pkgs.linuxPackages_zen; # default zen kernel
      };
      gaming.enable = true; # enable gaming module
      hardware.enable = true; # enable hardware module
      network.enable = true; # enable network module
      nix.enable = true; # enable nix module
      sddm = {
        enable = true; # enable sddm module
        theme = pkgs.hydenix.sddm-candy; # or pkgs.hydenix.sddm-corners
      };
      system.enable = true; # enable system module
    */
  };
}
