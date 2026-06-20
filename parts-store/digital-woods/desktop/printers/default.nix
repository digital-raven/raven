# Drivers for printers.
{pkgs, ...}: {
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.brlaser
  ];
}
