# Password management

The `pass` program allows users to easily bootstrap their own private
password manager with cloud backup, version control, and device sync
with offline access. Passwords are stored and encrypted locally.

## Foundation

**Remember these passwords to minimize manual entry.**

1. Passwords for encrypted systems. Enter during boot.
2. Local user accounts.
3. GPG Key password.

All other passwords are stored and accessed from `pass`.

## Pass Usage

`pass` stores passwords in a directory tree. The contents of each
file are encrypted with GPG, but the filenames are not. The tree is
located at `~/.password-store` by default.

Never forget the password you choose.

```
# Generate public / private gpg key pair.
gpg --generate-key

# Configure Pass.
pass init gpg-email@whatever.com
pass git init

# Random passwords for random aliases.
pass generate shopping/amazon/shopping.amazon.lake209@aleeas.com

pass generate drives/my-encrypted-drive 64 # Generate 64 chars long
pass -c drives/my-encrypted-drive # copy to clip-board
pass drives/my-encrypted-drive # show in stdout
pass edit rclone.conf # Copy rclone config here too.
```

## Backup

[Perform cold-storage backup via email](./email.md).

## Live-system Sync

There's a local git repo in `~/.password-store` and `pass` has git subcommands
to operate on it. If filepaths are of no concern then a remotely hosted
private repo is servicable as a sync solution.

```
cd ~/.password-store
git remote add origin <ssh-remote>
pass git pull
pass generate test-password # Commits automatically.
pass git push
```

#### Backing up 2FA

Some common webservices require 2-factor authentication via generated
code sent to a phone app. GitHub is one such example.

Aegis is an app that can satisfy 2FA requirements for a lot of websites.
GitHub, ProtonMail, PayPal...

Aegis can export its vault as a plaintext json file. Transfer it from
the smartphone to a computer and save in `pass edit`.
