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
    dolphin-emu # GC / Wii
    mame # Arcade
    mupen64plus # N64
    pcsx2 # PS2
    rpcs3 # PS3
    vbam # Gameboy advance
    zsnes # Super NES emulator
  ];

  # Launch these emulators using the alias followed by the emulator in the subshell.
  # They have been removed from Nix's mainline repos for various reasons, but should still operate.
  programs.bash.shellAliases = {
    raven-yuzu = "nix-shell -p yuzuPackages.mainline -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/087f43a1fa052b17efd441001c4581813c34bc19.tar.gz";
    raven-pcsxr = "nix-shell -p pcsxr -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/05bbf675397d5366259409139039af8077d695ce.tar.gz";
  };
}
