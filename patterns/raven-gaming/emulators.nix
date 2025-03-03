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
    mame         # Arcade
    mupen64plus  # N64
    pcsxr        # PS1
    pcsx2        # PS2
    rpcs3        # PS3
    vbam         # Gameboy advance
    zsnes        # Super NES emulator
    atlauncher   # Minecraft launcher
    clonehero    # Guitar Hero clone. Works with original controller with USB adapter.
    dwarf-fortress # 1000 gamer cred per minute
    katawa-shoujo # Takes a while to build and install.
  ];

  programs.bash.shellAliases = {
    raven-yuzu = "nix-shell -p yuzuPackages.mainline -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/087f43a1fa052b17efd441001c4581813c34bc19.tar.gz";
  };
}
