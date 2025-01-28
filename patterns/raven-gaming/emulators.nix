# For emulators and some games.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
  ];

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };

    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Packages
  # Add packages here.
  environment.systemPackages = with pkgs; [
    dolphin-emu  # GC / Wii
    higan        # Lots, but mostly SNES and NES
    mame         # Arcade
    mupen64plus  # N64
    pcsxr        # PS1
    pcsx2        # PS2
    rpcs3        # PS3
    vbam         # Gameboy advance
    clonehero    # Guitar Hero clone. Works with original controller with USB adapter.
    dwarf-fortress
    katawa-shoujo # Because I thought it was funny that it was here.
  ];
}
