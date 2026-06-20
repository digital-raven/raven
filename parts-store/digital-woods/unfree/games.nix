# Some standalone games.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    clonehero # Guitar Hero clone. Works with original controller with USB adapter.
    dwarf-fortress # 1000 gamer cred per minute
  ];
}
