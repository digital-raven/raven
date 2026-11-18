# Standalone games available directly from nixpkgs.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    atlauncher # Minecraft launcher.
    clonehero # Guitar Hero clone. Works with original controller with USB adapter.
    dwarf-fortress # 1000 gamer cred per minute
  ];
}
