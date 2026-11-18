# Popular emulators.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    azahar # Nintendo 3DS
    desmume # Nintendo DS
    dolphin-emu # GC / Wii
    mupen64plus # N64
    pcsx2 # PS2
    rpcs3 # PS3
    shadps4 # PS4
    vbam # Gameboy advance
    zsnes # Super NES emulator
  ];

  # Workaround for emulators removed by nixpkgs.
  # - citra: Nintendo 3DS
  # - yuzu: Nintendo Switch
  # - pcsxr: PS1
  #
  # These aliases create special shells. Launch the emulators from there.
  programs.bash.shellAliases = {
    raven-yuzu = "nix-shell -p yuzuPackages.mainline -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/087f43a1fa052b17efd441001c4581813c34bc19.tar.gz";
    raven-pcsxr = "nix-shell -p pcsxr -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/05bbf675397d5366259409139039af8077d695ce.tar.gz";
  };
}
