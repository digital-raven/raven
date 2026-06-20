# Home-manager
{...}: {
  imports = [
    # Core
    ../../parts-store/digital-woods/cores/raven-core/home-manager/default.nix

    # digital-woods defaults.
    ../../parts-store/digital-woods/terminal/editors/home-manager/default.nix
  ];
}
