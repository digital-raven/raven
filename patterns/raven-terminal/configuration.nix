{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from shared/modules):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
  ];

  # Command-line packages
  environment.systemPackages = with pkgs; [
    bash-completion  # Tab auto-complete
    btop  # Great system-profiler.
    cmus  # Music player
    docker
    dosfstools
    ffmpeg  # Powerful video and audio editor.
    file  # Print the type of a target file.
    gcc  # World's greatest c compiler.
    git  # World's greatest file versioning.
    gnumake
    gnupg
    home-manager
    iotop  # I/O monitor.
    lm_sensors  # System temperature information. Command is `sensors`.
    lynx  # Command-line web-browser.
    openssl  # Cryptography toolkit.
    man-pages  # Manuals for popular programs. `man <command>`
    man-pages-posix  # Manuals for classic POSIX programs and libraries.
    mullvad  # Raven's VPN of choice.
    neofetch  # Print system overview, but pretty!
    pandoc  # goes with texlive.combined.scheme-small for converting md to pdf.
    parted  # Hard-drive partition manager
    pass  # Command line password manager. See best practices in the user-guide.
    python3  # Install python packages using a virutal environment.
    qpdf  # One use is to append pdf files.
    rar  # Manipulate .rar archives.
    rclone  # Manipulate cloud-storage from command-line.
    rig  # Print surface-level fake people.
    rsync  # Quickly sync directories.
    smartmontools  # Storage device information, including drive health.
    srm  # Securely erase a file. Use -D for US DoD compliant 7-pass overwrite.
    sysstat  # System performance and usage activity.
    texlive.combined.scheme-small  # See pandoc.
    unzip  # Unzip .zip archives.
    vim  # World's greatest text editor.
    whois  # Look up who owns various URLs.
    wget
    yt-dlp  # Download videos from YouTube. YMMV.
    zip  # Create .zip archives.
    zsh  # Popular alternative to BASH.
  ];

  # Configure gnupg
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
  services.pcscd.enable = true;

  # Services
  # Configure services here.

  # SSH server.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";

      # Set to false if you don't want to be able to ssh via password.
      PasswordAuthentication = true;
    };
  };

  services.mullvad-vpn.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
