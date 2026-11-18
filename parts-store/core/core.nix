# Fundamental software that handles your shit.
#
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Full software dependency trace.
    nix-tree

    # Main shell and home-manager support.
    bash
    home-manager

    # Encrypt and obscure comms.
    mullvad

    git # World's best version control.
    vim # A damn fine pen.

    # Credential management.
    pass # Store all credentials. Encrypted with gpg.
    gnupg # Create / import gpg key.

    # Repository dependencies.
    direnv
    jq
    gum
  ];

  # Activate vpn connection and killswitch with mullvad-open.
  services.mullvad-vpn.enable = true;

  # Enable GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Key-only login ssh. Save ssh keys in pass.
  services.openssh = {
    enable = true;
    settings = {
      # No root login either.
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
