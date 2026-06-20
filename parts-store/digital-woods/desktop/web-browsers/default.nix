# Firefox and Brave to cover non-chromium and chromium bases.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave # Privacy-focused chromium browser.
  ];

  # Install firefox.
  programs.firefox.enable = true;
}
