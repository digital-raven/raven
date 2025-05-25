# Popular emulators.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
  ];

  environment.systemPackages = with pkgs; [
    dolphin-emu  # GC / Wii
    mame         # Arcade
    mupen64plus  # N64
    pcsxr        # PS1
    pcsx2        # PS2
    rpcs3        # PS3
    vbam         # Gameboy advance
    zsnes        # Super NES emulator
  ];

  # Launch yuzu by running `raven-yuzu` and then `yuzu` in the resulting subshell.
  programs.bash.shellAliases = {
    raven-yuzu = "nix-shell -p yuzuPackages.mainline -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/087f43a1fa052b17efd441001c4581813c34bc19.tar.gz";
  };
}
