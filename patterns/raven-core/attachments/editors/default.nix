# File editing and documentation tools.
#
# Vim is provided via the core.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Spell-check
    aspell
    aspellDicts.en
    aspellDicts.en-computers

    fzf # Fuzzy-find. Needed for vim plugin.

    neovim # Neovim.

    pandoc # goes with texlive.combined.scheme-small for converting md to pdf.
    qpdf # PDF manipulation. One use is to append pdf files.
    texlive.combined.scheme-small # See pandoc.
  ];

  # Alias to run neovim as configured in nixos-unified-template.
  # TODO: Un-alias this and actually integrate this properly.
  programs.bash.shellAliases = {
    rio = "nix run github:digital-raven/nixos-unified-template/main#neovim";
  };
}
