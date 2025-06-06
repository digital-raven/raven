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

1. If you don't have one already, create a GitHub account.
2. Fork [the Master Raven Repository](https://github.com/digital-raven/raven.git) repository to your
   GitHub account.
   - You can use the GUI on GitHub.
   - Or you can download the repository to your machine, create a private repo
     on GitHub and push a copy there. Create the private repo without any files.
3. Download and install [the NixOS ISO](https://nixos.org/download/) to a flashdrive.
   - [Rufus](https://rufus.ie/en/) can create a bootable flash drive if you're on Windows.
   - If you're on a Mac or a different Linux machine already, then download the NixOS ISO
     and use `dd` to install it to your flashdrive.

     `dd if=<your-nixos.iso> of=/dev/<your flashdrive block device>`

4. Boot your computer from your flash drive and go through the NixOS installer.
5. Download your forked repository from your GitHub and `cd` into it. Set up the
   following remotes.
   - `git remote add upstream https://github.com/digital-raven/raven.git`
   - `git remote add origin https://github.com/<your-github-username>/raven.git`
6. Create a git branch for your machine.
   - `git checkout -b your-machine`
7. Run the `./check` script at the top of this repository to list entries you need
   to replace. Each "REPLACEME_*" has a comment on how to replace the information.
8. Run through the update procedure below.

## Updating and making changes
Raven is simple to update once installed. There are only a few commands to
remember.

- First open a terminal window and `cd` into your repo's local copy.

- If you wish to grab changes from the Master Raven Repository, then run these commands.

  ```
  git fetch upstream
  git rebase upstream/master  # Apply your personal changes on top of Master's latest.
  ```

- If you wish to update currently installed packages, then run the
  following command before proceeding.

  `nix flake update`

- If you want to make custom changes to your installation, then you should read the
  following section, "Customizing Raven", before proceeding to the next step.

- Now run **one** of the following comamnds to turn your system into the specified
  Raven model. Your personal data will not be affected going from one to the other.
  If you accidentally install the incorrect model for your machine then simply run
  the command with your desired model.

  If ever you make custom changes to your Raven installation, this is the same command
  to apply those changes. The following commands are used for both applying changes
  and initial installations of Raven.

  ```
  sudo nixos-rebuild switch --flake .#raven-terminal
  sudo nixos-rebuild switch --flake .#raven-home
  sudo nixos-rebuild switch --flake .#raven-gaming
  ```

Depending on how drastic your changes were you may need to reboot. If it's your
machine's first time installing Raven then you should definitely reboot. If you're
using `raven-gaming` then change the display server to x11 on the login screen.

### Customizing Raven
Here is a brief orientation of Raven's directory structure.

- `docs`: User documentation and some memes illustrating the spirit of Raven's creation.
- `host`: System-specifics are located here, such as users and hardware info.
        You should use git branches to swith between different hosts if you use
        a Raven repository to manage multiple machines.
- `patterns`: Patterns describe the general purpose of your machine and contain
            useful packages for that purpose.

            You may make changes to patterns if you wish, but Raven reserves this
            space for altering pattern logic so changes here may produce merge conflicts.

            If you wish to add specific software to your machine, you should do it under `host`.
- `shared`: Add generic customizations here. This is for overlays, modules, custom
          packages, and generic home-manager modules you wish to share between
          your machines.

If you wish to customize your installation, start your grokking in `flake.nix`.
The `nixosConfigurations` defines the patterns of Raven and which .nix files
they pull in. Changes or additions to those files will change the pattern.
These changes can be applied to your installation with the appropriate
`nixos-rebuild switch` command shown in the previous section.

Home-manager is integrated as nix modules under the `host/users` directory.

## Managing multiple machines
It's likely you wish to install Raven on multiple machines. Perhaps you have a
computer for gaming and a computer for office work. It is also likely you may
wish to use Raven as an starting point to make your own modifications.

The most convenient method is to have one private repo for all your Raven machines
and create a git branch for a new machine when you install Raven to it. This makes
it easy to keep the machine-specific information easily separated, while being
able to conveniently port and compare extra changes between your installations.

## What Raven requires to use as intended
Raven is based on NixOS, and so your installation is declarative and reproducible.
This makes it trivial to recreate your set-up on other machines and reduces your
operating system to a simple set of text configuration files. The software and
documentation included in Raven are designed to assist with a private, powerful,
expressive, and personal digital ecosystem.

To make the most of these promises, here's what Raven recommends you create.

- 2 ProtonMail accounts; one "emergency" and one "core" account as detailed in the
  book [A Raven's Guide through the Digital Woods](https://github.com/digital-raven/digital-woods).
- A GitHub account, as a couple of private repositories will assist you greatly.
- A [mullvad](https://mullvad.net/en) account.

The first 2 will permanently secure your foothold into restoring your Raven
installations in the event of a fire or having your phone stolen. The last one
is just a damn nice and simple VPN.

## Common tasks
This section details how to perform common tasks with Raven.

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

### Basic desktop experience
All Raven models inherit the same terminal experience from `raven-terminal`, and
all graphical Raven models have the same utilities as `raven-home`.

All graphical Raven models support what you would expect for a minimum home
desktop experience; File browsing, media playing, web-browsing, printing,
and office software are included.

#### User management
The admin username for all raven patterns is "master". If you are the only
user on your raven installation, then this may suffice for you. "master" has
access to sudo for performing system tasks.

To change the password for master, use the `passwd` command.

#### Drive management
Drive management may be accomplished with the command-line `parted` program
or the graphical `gparted` program.

#### Media playback
The `vlc` program is installed on Raven and can play basically any video.
`cmus` is included as a command-line music player, or you may use the graphical
`elisa` program.

#### Web-browsing
Raven comes shipped with both Firefox and Brave. Both are decent browsing programs.

Raven does not recommend the use of any Brave features beyond its basic web-browsing
and sync features. Brave offers some odd features that Raven's author believes should
be avoided; such as its crypto wallet and rewards program. Brave has ad-blocking capability
enabled by default though, so using it to browse the web is quite quiet and convenient.

Feel free to use Brave's syncronization features for your internet-only passwords. This
makes moving between your machines convenient because you don't need to re-enter passwords
for your online accounts.

### Password management
Raven provides a program for password management, and the best password management
solution serves as an effective and total catalog of all your credentials.

The `pass` program is included with all versions of Raven. It's an inuitive program
which stores passwords in a simple directory tree under `~/.password-store/` by default.
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
pass generate -n shopping/amazon/amazon-username 16

# Omit the -n to get all sorts of characters
pass generate shopping/amazon/amazon-username 16

# Manually create or modify a password
pass edit shopping/amazon/amazon-username

# Print a password to your terminal.
pass shopping/amazon/amazon-username

# Add -c to copy a password to your clipboard. Only works with a desktop environment.
pass -c shopping/amazon/amazon-username
```

You can verify the contents are encrypted by printing contents of a file to stdout.
The following command will print encrypted garbage to the terminal.

`cat ~/.password-store/shopping/amazon/amazon-username`

#### Pass best practices
When a critical password is changed, you should create a cold backup of the store
and upload it to your core email account. This backup will be encrypted on your
end so even in the highly unlikely event your core email account is compromised then
your attackers will still not have access to your usernames.

```
cd $HOME
tar -zcf password-store.tar.gz ./.password-store/
gpg --encrypt password-store.tar.gz
```

The file `password-store.tar.gz.gpg` will now be created. Email it to yourself along with
some instructions to yourself.

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

The `pass` program comes included with git integration. Create a private GitHub repository
and use the `pass git` subcommands to keep your passwords in sync across your machines.

#### Backing up 2FA
Some common webservices require 2-factor authentication. Sometimes these are one-time codes
which you can generate using an app on your phone. Since GitHub requires 2FA and is where
Raven expects its users to store their machine-specific Raven repositories and pass vaults,
we should select a 2FA application which allows us to backup and import these 2FA codes
to a new device in case our phone becomes lost to us.

Aegis is a phone app that can satisfy the 2FA requirements of ProtonMail and GitHub.
Aegis allows its user to export its vault as a plaintext json file. When you add a new credential
to Aegis, you should export the vault on your phone and transfer it to your computer somehow.
Emailing it to yourself via ProtonMail should be a private and secure way to perform this before
deleting the copies from your phone and email.

Copy the text from the exported json and save it to `pass`. Because 2FA is necessary to log
in to your GitHub account, you should also replace your cold backup of your password store
in your email.

### Naked Restart
"Naked" means all of your devices were lost or otherwise inaccessible to you. A Raven user
will suffer no permanent damage from this so long as the following checklist is fulfilled.

- [ ] You've set up 2 email accounts; an emergency email and core email account.
  - [ ] Your emergency email is set up to recover your core email.
  - [ ] You memorized your emergency email username and password.
  - [ ] Your emergency email does not require 2FA; the password is enough.
- [ ] Your GitHub account has Aegis 2FA.
- [ ] Both your GitHub credentials and Aegis vault are saved to `pass`.
- [ ] Your GPG keys and pass vault have copies in your core email account.
- [ ] You saved your personal Raven configurations to GitHub in a private repo.

If all of those are performed, then congratulations! You have the ability to recreate your
digital ecosystem, including your customized operating system, starting from nothing other
than a new computer, phone, and internet access.

- [ ] Acquire a new computer, phone, and flashdrive.
- [ ] Install NixOS and `pass` to the new computer.
- [ ] Log in to your emergency email account and recover your core email account.
- [ ] Download your GPG keys and pass vault from your core email account.
- [ ] Install Aegis to your phone and import your vault.
- [ ] Log in to GitHub and install your custom Raven repository.

And if you've stored all your other credentials in `pass`, then you've also regained access
to all of your other accounts.

Your credentials and operating environment are fireproof and criminal-proof; just so long as
you **never forget** your emergency email username and password.

### Encrypted storage
You should encrypt your personal data on drives under your control.

- Computers get stolen, so you shouldn't form an emotional attachment to your hardware.
- Drives go bad, but if they're encrypted you can dispose of them without worry.

Raven comes shipped with the `veracrypt` program which can easily encrypt entire drives
or create encrypted volumes. These "volumes" are, in themselves, encrypted files that
may be mounted to your regular file system when you wish to use them. These volumes can
be safely stored on unencrypted drives.

A command line program to accomplish the same task is `cryptsetup`, and is a more widely
standard utility. [This blog](https://blog.thomas.maurice.fr/posts/cryptsetup/) has a set of
more comprhensive examples with keyfiles and YubiKeys, but here are some quick examples.

```
# To create and use an encrypted volume...

# First create a large but empty file.
fallocate -l 10G my-encrypted-block

# Encrypt it. You will give it a passphrase. Be sure to generate and save this passphrase in pass.
cryptsetup luksFormat my-encrypted-block

# Open it. This will create a block device in /dev/mapper .
sudo cryptsetup open ./my-encrypted-block my-encrypted-block

# Now we add a filesystem to it. You may choose many different filesystems, but we'll use ext4.
sudo mkfs.ext4 /dev/mapper/my-encrypted-block

# Now the filesystem can be mounted
sudo mount --mkdir /dev/mapper/my-encrypted-block ./my-encrypted-files

# Create an example file
sudo mkdir ./my-encrypted-files/files
sudo chown master ./my-encrypted-files/files
echo "Hello, but in secret!" > ./my-encrypted-files/files/hello

# Unmount and close the volume.
sudo umount ./my-encrypted-files
sudo cryptsetup close my-encrypted-files
```

Using the volume in the future is much easier.
```
sudo cryptsetup open ./my-encrypted-block my-encrypted-block
sudo mount --mkdir /dev/mapper/my-encrypted-block ./my-encrypted-files

# Read back our file
cat ./my-encrypted-files/files/hello
```

And if we wanted to encrypt and use a whole drive it's a similar process, but targets a block
device.

```
# First use parted or gparted to format your drive.
sudo gparted

# And then instead of a file, we'll target the drive. Let's say the drive was sdb and we only
# have one partition on it.

cryptsetup luksFormat /dev/sdb1
sudo cryptsetup open /dev/sdb1 my-encrypted-drive
sudo mkfs.ext4 /dev/mapper/my-encrypted-drive
sudo mount --mkdir /dev/mapper/my-encrypted-drive ./my-encrypted-files
```

### Gaming
Video games are fun and exciting, and many popular games work with Raven! The following
avenues for gaming are supported on Raven-Gaming.

**Conventional PC Gaming**
- Steam: Via the native Steam client for Linux. When you launch and log-in to Steam, go
         to `Steam -> Settings -> Compatibility` and "Enable Steam Play for all other titles".
         This will tell Steam to use Proton for all titles in your library. Valve has done
         a ton of great work for cross-platform game compatibility.

- GoG: GoG sells DRM-free games. GoG titles may be managed via the "Heroic Games Launcher"
       program shipped with Raven. You may configure titles in your library to use Steam's proton.

  - GoG also distributes its games with optional offline installers. These should be usable with
    the `wine` program, but your mileage may vary per game.

  - Heroic Games Launcher has some optional dependencies. They may be set [here](../patterns/raven-gaming/launchers.nix).

Epic and Prime gaming are also supported via the Heroic Games Launcher.

**Console Emulation**
Raven also ships with various emulators for retro and modern consoles.

- dolphin-emu: Best-in-class GameCube / Wii emulator.
- mame: Arcade games.
- mupen64plus: Nintendo 64.
- pcsxr: Sony's PlayStation.
- pcsx2: Sony's PlayStation 2.
- rpcs3: Sony's PlayStation 3.
- vbam: Its full name is VisualBoyAdvance. Emulates the Nintendo Gameboy Advance and, by
        extension, the GameBoy and GameBoy Color.
- zsnes: SNES emulation.

**Other Games**
Raven
- clonehero: Guitar Hero clone. Works with original controller with USB adapter.
- dwarf-fortress: Hardcore base-management survival sim. Gives you 1000 gamer cred per minute.
- atlauncher: Minecraft launcher. Requires a valid Minecraft account.

#### Emulation
If you've wanted to play games from popular consoles on your computer,
raven-gaming includes many popular emualators.

#### Yuzu
Raven does not technically come shipped with Yuzu, but the following commands will fetch it
and create a sub-shell where Yuzu may be launched.

```
[master@raven-gaming:~/]$ raven-yuzu
[nix-shell:~/]$ yuzu
```

Yuzu requires Switch keys in order to run. You may rip them yourself from a Switch you own.
If you own a Switch but find the task of ripping keys from it daunting, then you may pirate
a Switch game you own and the pirated game will likely contain the keys. Doing this does not
harm Nintendo, as you paid them for the Switch and the game already.

To move the keys to Yuzu, open your Yuzu folder by launching Yuzu and going to `File -> 
Open yuzu folder` and place `prod.keys` into `keys`.

If you decide on the second route, see the "Piracy" section of this guide for how to avoid
drama with your ISP, as well as the section below on Yuzu ethics and history.

##### Yuzu Ethics and a brief history
See the "Piracy" section for a quick class on ethics regarding Yuzu's use.
Specific notes regarding Yuzu are included here.

Many emulators exist for other Nintendo systems and are perfectly legal and continue
their development under their original development teams and websites. Many were
developed and released while their target systems were still active on the market.
For example, Dolphin Emulator is a GameCube / Wii emulator released in 2003 and the
GameCube was still very active on store shelves in that year, and Dolphin Emulator
continues its development and distribution to this day. Dolphin had Wii support in 2008,
and the Wii was still a very hot commodity on store shelves having released in November 2006.
Why is Yuzu considered a black sheep in this field?

Nintendo released "Legend of Zelda: Tears of the Kingdom" in May 2023. Nintendo
poured a lot of resources into TotK and the game was leaked online about 2 weeks
before its official release date. Millions of people pirated the game and used Yuzu to
play it before the official release, and Nintendo attributes this to lost sales.

Additionally, the Yuzu team's Discord chats leaked and it was found they were running an
internal culture of piracy. They were not only celebrating the leak, but were distributing
Switch keys to their members. Switch keys are the intellectual property of Nintendo, and
Raven does not provide these keys. You will have to get them yourself, but this document
contains instructions on how to procure them.

Nintendo discovered Yuzu's behavior and issued a very strong legal action against them. Yuzu
was forced to cease their development, take down their website, and many popular avenues for
downloading Yuzu decided to remove it (GitHub, Canonical's Ubuntu, the Arch-Linux repo...).
Yuzu was also forced to issue a $2.4 million settlement to Nintendo.

The short legal battle between Nintendo and Yuzu also caused collateral damage in the
emulation scene. Nintendo also issued notice to Ryujinx (another popular Switch emulator) and
it was taken down despite having no affiliation to Yuzu. Citra, an emulator for the Nintendo 3DS
which was also developed by Yuzu, was also forced to cease its development and distribution.

Today, various forks of Yuzu and Citra exist under new developers with various disclaimers
regarding the facts stated above.

However soured these waters are, it does not change the fact that Yuzu is, on its own,
not a tool for piracy. It is an alternative avenue for playing Switch games that allows users
more versatility in how they enjoy their games.

If you purchase your own Switch and only pirate ROMs from Switch games you own then you
will have appropriately rewarded Nintendo for their artistic efforts and will be using
Yuzu in an ethically correct fashion.

## PDF
The `evince` program is installed for viewing PDFs. It will launch automatically
if you double click on the file, or launch it through the terminal window.

If you need to sign a pdf or otherwise write on it, use the `xournal` program.

If you need to append pdf files together then you can use the qpdf program.
Here is an example which appends one pdf to another and saves the result.

```
qpdf first.pdf second.pdf -- out.pdf  
```

You can also convert markdown files to pdf easily with the following command.
```
pandoc example.md -o example.pdf
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

#### Popular piracy sites
The Pirate Bay continues its operation to this day and remains the most consistent
site to search for and pirate content. Its official site is thepiratebay with a
.org extension.

#### Necessary programs
Raven comes installed with `mullvad` and `qbittorrent` to assist you.

Create a mullvad account. Mullvad is cheap and has a flat pricing structure, and
is easy to use on Raven. Save your account number to `pass`.

Run `mullvad account login` and enter your account number. Then run `mullvad-open`.
This will set the killswitch and open a connection to mullvad. The killswitch
will prevent your computer from communicating with the internet if the vpn is not
active. If you wish to turn the vpn off, then run `mullvad-close`.

Those afore-mentioned commands are aliases to conveniently maniuplate both the
killswitch and connection status. [This webpage](https://mullvad.net/en/help/how-use-mullvad-cli)
has comprehensive information on how to use the `mullvad` command.

But there is one more common operation; changing the connection region. To
change the region of the server you log in to, run `mullvad relay set location <country-code> [city]`,
where `[city]` is optional.

For example, to change your region to the United States, run `mullvad relay set location us` .
Mullvad's default country is Sweden, who's code is `se`.

But the killswitch alone is not enough protection. You need to tell qBittorrent
to use a proxy. Open qBittorrent and change these settings.

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
a non-vpn interface, which it will do if you accidentally.

#### VPNs and their use
If you've seen any number of internet videos then you've probably seen creators
sponsered by VPN companies. Those sponsered placements tend to be full of hype
and lies. We'll go ahead and clear those up.

- A VPN is not, on its own, a security tool; it is an obscurity tool. It masks who
  you're talking to from your ISP. Your ISP can obviously see that your traffic is
  being routed to your VPN provider, but they won't know the final recipient.
- You don't need a VPN to protect your credentials. Traffic between your computer
  and the vast majority of websites these days is securely encrypted by the
  https protocol.
- You don't need a VPN to avoid malware. Downloading malware is agnostic to your VPN.
  If there are shady websites then it is your job to avoid them and to avoid downloads
  from such websites.

Reasons to use a VPN.

- You don't like the idea of your ISP knowing which websites you visit. This represents
  a single point of query for any interested party in gathering detailed information about
  your internet habits. A VPN forces an ISP to serve as a private mailman and prevents them
  from acting as partial judge.
- You pirate content (see this guide's section on Piracy for basic ethics).
- You wish to access content unavailable in your region.
- You engage with online forums and don't like the idea of said forums becoming compromised
  and having your username and location doxxed. No one can vouch for the security of
  every website, and there are some crazy people in the world.

When your computer makes a web-request without a VPN it communicates the address of the
recipient to your ISP and includes the packets of data in the request. A VPN connection
encrypts your original request, recipient included, and tells your ISP to send it instead
to your VPN provider, and then your VPN provider unwraps it and makes the request for you
before sending it back.

This requires you to trust your VPN provider. While Raven endorses Mullvad (without sponsership),
any VPN provider worth their salt will have a zero-logging policy verified by third-party audit,
include a killswitch, and will require some sort of on-going fee. Never, under any circumstances,
trust a free VPN. Proper VPN operation requires overhead that only paying customers can offset
and justify.

The reason Raven endorses Mullvad is because Mullvad only requires an account number which
Mullvad generates for you, and has a convenient command line tool that proved easy to install
and use. Mullvad also allows you to mail cash to them, which is a nice privacy touch.

If you do illegal stuff online then a VPN will not protect you. You will need to take
additional measures with respect to your operational security. Here are a couple of examples
of bad opsec.

- Ross Ulbrict (Dread Pirate Roberts) was, in part, caught for running Silk Road because the
  oldest forum post on the surface web related to Silk Road was made with an account whose
  username was "Altoid", and that username later made a post asking interested enterprisers
  to email rossulbrict@gmail.com.
- In December of 2014, a Harvard student by the name of Eldo Kim used the Tor web-browser to
  issue a fake bomb threat to attempt to buy time to study for his final exams. He made this
  threat while using Harvard's network, and only 2 computers on campus were using Tor at
  the time of the threat. It was pretty easy to find which machine issued the threat.

### Crypto currencies
In general, avoid crypto currencies. The domain is rife with scams, but some crypto
currencies are honest, and Bitcoin is one of them. [Here is an excellent video](https://www.youtube.com/watch?v=bBC-nXj3Ng4) detailing how Bitcon works.

Because a software Bitcoin wallet allows you to easily recover your wealth on any computer,
and because no regulatory body can control your Bitcoin wallet without your consent, this
sort of wallet represents a method to allow users to fundamentally be in control of their
wealth. For example, the American IRS cannot "freeze" a Bitcoin wallet, and cannot prevent
you from taking your software Bitcoin wallet overseas. Hardware wallets are technically
more "hack proof", but come with the risk of loss, theft, or fire.

To this end, Raven comes shipped with a Bitcoin wallet program called `electrum`.
Electrum can create a bitcoin wallet that can be recovered on any computer via a recovery
phrase. Electrum calls this phrase "seed". Save your seed to your pass vault. Never lose it,
and never tell anyone what it is.

Your electrum wallet will be created with a set of "Receiving" addresses that may be used
to receive funds to the wallet. If you wish to fund it, then either set up a bitcoin miner
and direct it to your wallet, or purchase funds on an exchange and send them there. Coinbase
is an example of a legitimate crypto exchange.

[Here is Electrums' FAQ page](https://electrum.readthedocs.io/en/latest/faq.html) with more
details on how Electrum works. Read it before you start putting money into this wallet.
