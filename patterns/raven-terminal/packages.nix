{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  # Command-line packages
  environment.systemPackages = with pkgs; [
    bash-completion # Tab auto-complete
    btop # Great system-profiler.
    cmus # Music player
    docker
    dosfstools
    ffmpeg # Powerful video and audio editor.
    file # Print the type of a target file.
    fzf
    gcc # World's greatest c compiler.
    gnumake
    gnupg
    iotop # I/O monitor.
    killall # Kill all processes by name
    lm_sensors # System temperature information. Command is `sensors`.
    lynx # Command-line web-browser.
    openssl # Cryptography toolkit.
    man-pages # Manuals for popular programs. `man <command>`
    man-pages-posix # Manuals for classic POSIX programs and libraries.
    mullvad # Raven's VPN of choice.
    neofetch # Print system overview, but pretty!
    p7zip # Handle .7z archive files.
    pandoc # goes with texlive.combined.scheme-small for converting md to pdf.
    parted # Hard-drive partition manager
    python3 # Install python packages using a virutal environment.
    qpdf # One use is to append pdf files.
    rar # Manipulate .rar archives.
    rclone # Manipulate cloud-storage from command-line.
    rig # Print surface-level fake people.
    rsync # Quickly sync directories.
    smartmontools # Storage device information, including drive health.
    srm # Securely erase a file. Use -D for US DoD compliant 7-pass overwrite.
    sysstat # System performance and usage activity.
    texlive.combined.scheme-small # See pandoc.
    unzip # Unzip .zip archives.
    whois # Look up who owns various URLs.
    wget
    yt-dlp # Download videos from YouTube. YMMV.
    zip # Create .zip archives.
    zsh # Popular alternative to BASH.

    (pkgs.writeShellApplication # CREDIT: https://www.youtube.com/watch?v=7QLhCgDMqgw
      
      {
        name = "nix-search";
        runtimeInputs = with pkgs; [
          fzf
          nix-search-tv
        ];
        text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
      })
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
      PasswordAuthentication = false;
    };
  };

  services.mullvad-vpn.enable = true;

  # Alias to run neovim as configured in nixos-unified-template.
  # TODO: Un-alias this and actually integrate this properly.
  programs.bash.shellAliases = {
    rio = "nix run github:digital-raven/nixos-unified-template/main#neovim";
  };
}
