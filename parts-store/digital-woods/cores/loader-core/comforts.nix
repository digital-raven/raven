# Basic shell comforts.
{pkgs, ...}: {
  imports = [
  ];

  environment.systemPackages = with pkgs; [
    bash-completion # Tab auto-complete
    man-pages # Manuals for popular programs. `man <command>`
    man-pages-posix # Manuals for classic POSIX programs and libraries.
    neofetch # Pretty-print system overview.
    tmux # Terminal multiplexer.
  ];
}
