{pkgs, ...}: {
  imports = [
    ./printers.nix
  ];

  environment.systemPackages = with pkgs; [
    evince # PDF.
    libreoffice # FOSS answer to MS Office.
    xournalpp # Edit PDF.
  ];
}
