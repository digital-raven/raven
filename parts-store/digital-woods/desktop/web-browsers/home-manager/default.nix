# Firefox and Brave to cover non-chromium and chromium bases.
{...}: {
  imports = [
    ./brave.nix
    ./firefox.nix
  ];
}
