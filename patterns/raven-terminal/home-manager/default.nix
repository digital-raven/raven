{...}: {
  imports = [
    ./bash.nix
    ./nvim.nix
    ./vim.nix

    # Active home-manager attachments.
    ../attachments/home-manager.nix
  ];
}
