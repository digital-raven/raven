# Common utilities for desktop computers.
{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./emulators.nix
    ./media.nix
    ./obs-studio
    ./office
  ];

  # General Packages
  environment.systemPackages = with pkgs; [
    kitty # Great desktop-agnostic terminal emulator.
    wine # For running windows executables.
  ];

  # Enables trash and network options in a file explorer.
  services.gvfs.enable = true;
}
