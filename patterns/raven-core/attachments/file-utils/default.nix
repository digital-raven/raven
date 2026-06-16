# Archivers, file tools, and file-system support.
{pkgs, ...}: {
  imports = [
    # Uncomment to use unfree components.
    #./unfree/default.nix
  ];

  environment.systemPackages = with pkgs; [
    dosfstools # Use FAT file systems.
    file # Print the type of a target file.
    p7zip # Handle .7z archive files.
    srm # Securely erase a file. Use -D for US DoD compliant 7-pass overwrite.
    unzip # Unzip .zip archives.
    zip # Create .zip archives.
  ];
}
