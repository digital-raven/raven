# File editing and documentation tools.
#
# Vim is provided via the core.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Spell-check
    aspell
    aspellDicts.en
    aspellDicts.en-computers

    pandoc # goes with texlive.combined.scheme-small for converting md to pdf.
    qpdf # PDF manipulation. One use is to append pdf files.
    texlive.combined.scheme-small # See pandoc.
  ];
}
