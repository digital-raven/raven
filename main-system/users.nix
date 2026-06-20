# Edit this file to add or remove users to/from the system.
# Configure home-manager under ./home-manager
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Disable root user. Nothing hashes to just "!", so this effectively disables
  # password authentication for root.
  # A user with sudo access can still use `sudo su` to get into root.
  users.users.root.hashedPassword = "!";

  # Copy this block to create additional root users.
  users.users.master = {
    # Change this password (using passwd) after rebooting!
    initialPassword = "master";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      # Add your SSH public key(s) here, if you plan on using SSH to connect
    ];

    extraGroups = [
      "master"
      "docker"
      "networkmanager"
      "wheel" # This grants sudo access
    ];
  };

  # Uncomment the following to give the system a "guest" user.
  #users.users.guest = {
  #  # Change this password (using passwd) after rebooting!
  #  initialPassword = "guest";
  #  isNormalUser = true;
  #  openssh.authorizedKeys.keys = [
  #    # Add your SSH public key(s) here, if you plan on using SSH to connect
  #  ];
  #  extraGroups = [
  #    "guest" # EDIT_ to the new username.
  #  ];
  #};
}
