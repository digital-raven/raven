# Archivers, file tools, and file-system support.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dosfstools # Provides mkfs.fat, fsck.fat and fatlabel
    # to create, check, and label FAT file systems.
    file # Print the type of a target file.
    p7zip # Handle .7z archive files.
    rar # Manipulate .rar archives.
    srm # Securely erase a file. Use -D for US DoD compliant 7-pass overwrite.
    unzip # Unzip .zip archives.
    zip # Create .zip archives.
  ];
}
