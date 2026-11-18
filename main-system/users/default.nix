# Edit this file to add or remove users to/from the system.
#
# Use `passwd` on first login!
#
# Configure home-manager under ./home-manager
#
{...}: {
  # Disable root. Nothing hashes to just "!".
  # A user with sudo access can still use `sudo su` to get into root.
  users.users.root.hashedPassword = "!";

  # Copy to create privileged users.
  users.users.master = {
    initialPassword = "master";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      # Add SSH public key(s) here.
    ];

    extraGroups = [
      "master"
      "docker"
      "networkmanager"
      "wheel" # This grants sudo access
    ];
  };

  # Uncomment or copy to create a "guest" user.
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
