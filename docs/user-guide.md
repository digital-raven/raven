# Raven User Guide
Raven is simply implemented as a set of Nix flakes, and is designed to be
installed on top of an existing NixOS installation.

Raven segregates its models by "patterns".
- `raven-terminal`: Provides a common terminal experience. All other patterns
    base themselves on raven-terminal.
- `raven-home`: For most people. Provides a graphical desktop environment and
    office software, and drivers for printers.
- `raven-gaming`: For gamers and computers with discrete graphics cards. Steam and
    the best emulators for various console systems are installed by default.

## New User Installation
If you don't wish to install Raven to an existing drive, then there are flash
drives available for purchase with Raven pre-installed.

If you'd rather save money, then installing Raven is straightforward.

1. If you don't have one already, create a github account.
2. Fork [the Master Raven Repository](https://github.com/digital-raven/raven.git) repository to your own account.
   - You can use the GUI on GitHub.
   - Or you can download the repository to your machine, create a private repo
     on GitHub and push a copy there. Create the private repo without any files.
3. Download and install the NixOS ISO to a flashdrive.
   - [Rufus](https://rufus.ie/en/) can create a bootable flash drive if you're on Windows.
4. Reboot your computer from your flash drive and go through the NixOS installer.
5. Download your forked repository from your github and ensure the following remotes
   are set up.
   - `git remote add upstream https://github.com/digital-raven/raven.git`
   - `git remote add origin https://github.com/<your-github-username>/raven.git`
6. Run through the update procedure below.

## Updating and making changes
Raven is simple to update once installed. There are only a few commands to
remember.

- Rebuild your your system with any changes you've made, or perform a first-time
  installation on a base NixOS installation.

  `sudo nixos-rebuild switch --flake .#raven-gaming`

- Update your home-manager

  `home-manager switch --flake .#master@raven-gaming`

If you wish to get updates for currently installed software, then run the
following command and repeat the above 2.
- `nix flake update`

Run these if you wish to update your copy of Raven with the latest from the
Master Raven Repository.
```
git fetch upstream
git merge upstream/master
```

After installing NixOS and going through the installation procedure in the [README](../README.md),
one of these patterns may be installed by running one of the following commands.

- `sudo nixos-rebuild switch --flake .#raven-terminal`
- `sudo nixos-rebuild switch --flake .#raven-home`
- `sudo nixos-rebuild switch --flake .#raven-gaming`

Then reboot your computer and log in. Make sure you change the display server
to x11 on the login screen if it's your first time.

## Managing multiple machines
It's likely you wish to install Raven on multiple machines. Perhaps you have a
computer for gaming and a computer for office work. It is also likely you may
wish to use Raven as an starting point to make your own modifications.

The most convenient method is to have one private repo for all your Raven machines
and create a git branch for each of your machines within that repo.

## What Raven requires to use as intended
Raven is based on NixOS, and so your installation is declarative and reproducible.
This makes it trivial to recreate your set-up on other machines and reduces your
operating system to a simple set of text configuration files. The software and
documentation included in Raven are designed to assist with a private, powerful,
expressive, and personal digital ecosystem.

To make the most of these promises, here's what Raven recommends you create.

- 2 ProtonMail accounts; one "emergency" and one "core" account as detailed in the
  book [A Raven's Guide through the Digital Woods](https://github.com/digital-raven/digital-woods).
- A GitHub account, as a couple of private reposotories will assist you greatly.
- A [mullvad](https://mullvad.net/en) account.

The first 2 will permanently secure your foothold into restoring your Raven
installations in the event of a fire or having your phone stolen. The last one
is just a damn nice and simple VPN.

## Common tasks
This section details how to perform common tasks with Raven's applications.

### Installing new software
A huge strength of NixOS is because each application has its runtime isolated
from other applications, software from older versions of NixOS should have no
issue running on your machine.

However if a package has been removed from the main repositories of NixOS then
it may not be trivial to install it.

[This website](https://lazamar.co.uk/nix-versions/) allows a user to search
older NixOS versions for any package, and will print the command to install and
run that software. The easiest way is to run the command in a terminal window,
and then launch the program from there.

### User management
The admin username for all raven patterns is "master". If you are the only
user on your raven installation, then this may suffice for you. "master" has
access to sudo for performing system tasks.

To change the password for master, use the `passwd` command.

### Encrypted storage

### Password management
Raven provides a program for password management, and the best password management
solution serves as an effective and total catalog of all your credentials.

The `pass` program is included with all versions of Raven. It's an inuitive program.
Passwords are stored in a simple directory tree under `~/.password-store/` by default.
Each file is locally encrypted using your gpg key, but the filenames themselves are
not encrypted.

#### GPG Key generation
Run `gpg --generate-key` to generate your public / private gpg key pair. Select a long
and unique, but memorable, password for your secret key. If you forget this password
then you will lose access to all your passwords managed by `pass`!

It is also advised to upload backups of these keys to your core email account. This
will ensure you maintain copies even if your house burns down.

```
gpg --export-secret-keys username@myemail.com > username.sec.gpg
gpg --export username@myemail.com > username.pub.gpg
```

Then email these 2 files to yourself and delete the local copies.

#### Examples
```
# Randomly generate a 16 character long alpha-numeric password
pass generate -n shopping/amazon/shopping.amazon.tricky123@aleeas.com 16

# Omit the -n to get all sorts of characters
pass generate shopping/amazon/amazon-username 16

# Manually create or modify a password
pass edit shopping/amazon/amazon-username

# Print a password to your terminal.
pass shopping/amazon/amazon-username

# Add -c to copy a password to your clipboard. Only works with a desktop environment.
pass -c shopping/amazon/amazon-username
```

You can verify the contents are encrypted by running `cat ~/.password-store/shopping/amazon/amazon-username`.
It should print encrypted garbage to the terminal.

#### Pass best practices
When a critical password is changed, you should create a cold backup of the store
and upload it to your core email account. This backup will be encrypted on your
end so even in the highly unlikely event your core email account is compromised then
your attackers will still not have access to your usernames.

```
cd $HOME
tar -zcf': tar -zcf password-store.tar.gz ./.password-store/
gpg --encrypt password-store.tar.gz
```

The file `password-store.tar.gz.gpg` will now be created. Email it to yourself along with some
instructions to yourself.

> Backup of my password store. Update this backup when changing or adding a core password. These are passwords that cannot be recovered if forgotten, and may be necessary for bootstrapping a new installation.
>
> To update this backup, send an email to yourself with the same subject line and text as this email. Then archive and attach the password store folder.
>
> ```
> tar -zcf password-store.tar.gz ~/.password-store
> gpg --encrypt password-store.tar.gz
> ```
>
> And then attach the gpg-encrypted file to this email, send it, and delete the previous email.

To fetch this cold backup to a new machine...
- Log in to your email from the new machine and download `password-store.tar.gz.gpg`
- If necessary, also download and import your gpg keys and set the trust for your own keys

And since Raven is designed for easy user access across multiple machines, we have also
thought of a solution for distributed password access.

The `pass` program comes included with git integration. Create a private github repository
and use the `pass git` subcommands to keep your passwords in sync across your machines.

#### Backing up 2FA
Some common webservices require 2-factor authentication. Sometimes these are one-time codes
which you can generate using an app on your phone.

Since github is one of these, and backing up your local Raven files is part of the intended
use of Raven, it is recommended to use pass to back up any required files 

Aegis is a phone app that can satisfy the 2FA requirements of protronmail and github.
Aegis allows its user to export its vault as a plain json file. When you add a new credential
to Aegis, you should export the vault on your phone and transfer it to your computer somehow.
Emailing it to yourself via protonmail should be a private and secure way to perform this.

Then copy the text from the exported json and save it with the pass program. Because 2FA is
necessary to log in to your github account, you should also create a cold backup of your pass

### AI integration with your text editor

### Gaming
Video games are fun, and many popular games work with Raven!

### Emulation
If you've wanted to play games from popular consoles on your computer,
raven-gaming includes many popular emualators.

#### Yuzu
One exception is Yuzu. Copies of Yuzu are hard to come by these days because of
Nintendo's legal battles against it. You may use this

## PDF
The `evince` program is installed for viewing PDFs. It will launch automatically
if you double click on the file, or launch it through the terminal window.

If you need to sign a pdf or otherwise write on it, use the `xournal` program.

If you need to append pdf files together then you can use the qpdf program.
Here is an example which appends one pdf to another and saves the result.

```
qpdf first.pdf second.pdf -- out.pdf  
```

### Piracy
Before we begin, we'll cover some ethics.

1. Pay whenever possible. Sometimes we want movies, music, or video games on
   our computer and torrenting someone else's file is easier than ripping your
   own. Only pirate media you've already paid for or otherwise own.
2. Some video games have DRM which makes their legal versions unusable. Piracy
   is the only way to play them in this case.
3. Some media isn't for sale anymore, and creating a new copy from fellow
   pirates doesn't cost the original publisher anything.
4. If you have a malfunctioning video game console or want to play console video
   games on your higher performance machine, it is morally ok to pirate a copy
   to put onto your computer.
5. Maybe what you want isn't available for purchase in your region. In that
   case you can't buy what isn't being sold and piracy may be your only option
   to enjoy it. Buy it when it comes to a store near you.

Regardless, using torrents to download proprietary content will legally be viewed
as "copyright infringement" and you can expect to get a letter from your ISP if
you don't use a VPN and proxy. Raven comes installed with utilities to avoid this
drama. Besides, you paid the creators already.

Raven comes installed with `mullvad` and `qbittorrent` to assist you.

Create a mullvad account. Mullvad is cheap and has a flat pricing structure, and
is easy to use on raven. Save your account number to `pass`.

Run `mullvad account login` and enter your account number. Then run `mullvad-open`.
This will set the killswitch and open a connection to mullvad.

But the killswitch alone is not enough protection. You need to tell qBittorrent
to use a proxy. Open qBittorrent and change these settings. This proxy will not
be able to seed torrents to fellow pirates, but you will be able to download them.

**Connection**
- Under "Proxy Server", use SOCKS5, Host 10.64.0.1, and port 1080
- Tick "Authentication", and use your mullvad account number for the password.
- Tick "Use proxy for Bittorrent purposes", "Use proxy for peer connections",
"Use proxy for RSS purposes", and "Use proxy for general purposes".

**BitTorrent**
- Disable DHT, PeX, and Local Peer Discovery.
- Enable anonymous mode.

**Advanced**
- Use `wg0-mullvad` for network interface. This prevents qBittorrent from using
a non-vpn interface, which would be bad.
