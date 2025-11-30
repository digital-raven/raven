# Raven-minimal doesn't offer any added home-manager functionality by default.
{...}: {
  imports = [
    # Home-manager active attachments.
    ../attachments/home-manager.nix
  ];
}
