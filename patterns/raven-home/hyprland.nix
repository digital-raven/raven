# KDE specifc packages and configuration.
{pkgs, ...}: {
  # You can import other NixOS modules here
  imports = [
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  hardware.opengl.enable = true;

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
  # ...
}
