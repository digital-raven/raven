# Extra kit.
#
# This kit contains programs that, while not strictly speaking necessary,
# have near-universal utility.
{pkgs, ...}: {
  # Allow for running docker containers.
  virtualisation.docker.enable = true;

  # Command-line packages
  environment.systemPackages = with pkgs; [
    # Hardware management.
    parted # Hard-drive partition manager.

    # Developer basics.
    clisp # GNU CLISP.
    docker # Run docker containers.
    gcc # World's greatest c compiler.
    gnumake # Make.
    python3 # Install python packages using a virtual environment.

    # Shell comforts and tools.
    killall # Kill all processes by name.
    openssl # Cryptography toolkit.
    man-pages # Manuals for popular programs. `man <command>`
    man-pages-posix # Manuals for classic POSIX programs and libraries.
    neofetch # Pretty-print system overview.
    rig # Print surface-level fake people.
    tmux # Terminal multiplexer
    zsh # Popular alternative to BASH.

    # Network copy tools and cloud storage manipulation.
    rclone # Manipulate cloud-storage from command-line. Save config to pass.
    rsync # Remote and local file copying. Excellent for syncing directories.
    wget # Download files from known URLs.

    # Web-browser.
    lynx # Command-line web-browser.

    # Basic network tools.
    whois # Look up who owns a URL.
  ];
}
