# Read the wiki for better information on printers.
# https://wiki.nixos.org/wiki/Printing
#
# A brother laser driver is provided
{pkgs, ...}: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed

      brlaser # Brother printers.
    ];
  };

  services.ipp-usb.enable = true;
}
