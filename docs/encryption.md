# Encryption

Only ever store personal data encrypted.

The system itself may be encrypted, and comes with
useful tools for storage management.

## System Encryption

Use a LUKS disko profile when prompted by `raven-configure`. You'll set
a password when running the manual `disko` command shown at the end.

This password must be entered manually by the user for each boot.
[pass cannot remember it for you](./pass.md).

The resulting installation, and all data on it, will be protected by
this password.

## Local Encryption

Use `cryptsetup` to mange other drives. Generate
[long and random passwords for each](./pass.md).

```
# Verify drive to format.
sudo smartctl -i /dev/sdb

# Generate long password. 45 second clipboard-access.
pass generate drives/my-drive 64 # New drives only
pass -c drives/my-drive         

# Cryptsetup
sudo cryptsetup luksFormat /dev/sdb1 # New drives only
sudo cryptsetup open /dev/sdb1 my-drive

# Local filesystem
sudo mkfs.ext4 /dev/mapper/my-drive # New drives only
sudo mount /dev/mapper/ ~/Mounts/my-drive
```

Veracrypt is also available in the unfree section. It's not bad at its job.

### Encrypted Cloud Storage

The `rclone` program can manage encrypted remotes. 

The files and their names will be stored as encrypted blobs on the remote,
but rclone mounts on them cleanly to the local filesystem.

There are many cloud storage providers. pCloud sells lifetime cloud
storage plans for personal use, and works well with Rclone's device-side
encryption.

Regardless of your chosen providers the procedure is similar.

```
# First create a clean remote to the provider
rclone config # name = provider

# Then create a second, encrypted remote around said provider.
# name = Crypted
# remote = provider:Crypted
rclone config 

# Copy ~/.config/rclone/rclone.conf to pass
# The passwords to the encrypted remotes are stored in plaintext
# in rclone.conf.
pass edit drives/rclone.conf

# rclone operations will now work on the remote
rclone mkdir Crypted:Cinema
rclone mount Crypted:Cinema ~/Cinema
```

Files moved into an rclone mount will be uploaded. Files removed
from one will be deleted. Operations like `rclone copy` can also
tackle similar tasks.

Back up your Rclone's configuration to `pass`.
