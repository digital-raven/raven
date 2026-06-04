# These tools allow for full use of the Raven repository and
# credential management.
#
# Also includes and enables a VPN for masked communication.
{pkgs, ...}: {
  # Command-line packages
  environment.systemPackages = with pkgs; [
    # Main shell and home-manager support
    bash
    home-manager

    # Encrypt and obscure your comms.
    mullvad

    git # World's best version control.
    vim # A #2 pencil with lasers.

    # Credential management.
    pass # Store all credentials. Encrypted with gpg.
    gnupg # Create / import your gpg key.

    # raven-configure dependencies
    jq
    gum
  ];

  # Run mullvad-open to lock network to VPN only.
  services.mullvad-vpn.enable = true;

  # Enable GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Enable and configure ssh.
  services.openssh = {
    enable = true;
    settings = {
      # No root login via ssh.
      PermitRootLogin = "no";

      # key-only entry by default. Save ssh keys in pass.
      PasswordAuthentication = false;
    };
  };
}
