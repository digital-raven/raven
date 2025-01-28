# Raven User Guide
Raven provides configurations which a user applies to an existing NixOS
installation.

Raven is divided into "patterns".
- raven-terminal: Provides a common terminal experience. All other patterns
    base themselves on raven-terminal.
- raven-desktop: For most people. Provides a graphical desktop environment and
    office software, and drivers for printers.
- raven-gaming: For gamers and computers with discrete graphics cards. Steam and
    the best emulators for various console systems are installed by default.

After installing NixOS and going through the installation procedure in the [README](README.md),
one of these patterns may be installed by running one of the following commands.

- `sudo nixos-rebuild switch --flake .#raven-terminal`
- `sudo nixos-rebuild switch --flake .#raven-desktop`
- `sudo nixos-rebuild switch --flake .#raven-gaming`

Then reboot your computer and log in. Make sure you change the display server
to x11 on the login screen if it's your first time.

## Common tasks
This section details how to perform common tasks and use Raven various purposes.

### Installing new software
A huge strength of NixOS is because each application has its runtime isolated
from other applications, software from older versions

However if a package has been removed from the main repositories of NixOS then
it may not be trivial to install it.

[This website](https://lazamar.co.uk/nix-versions/) allows a user to search
older NixOS versions for any package, and will print the command to install and
run that software. You can use this command as a guide for what to add to 

### User management
The admin username for all raven patterns is "master". If you are the only
user on your raven installation, then this may suffice for you. master has
access to sudo for performing system tasks.

To change the password for master, use the `passwd` command.

### Encrypted storage

### Password management
pass

### AI integration with your text editor
Go to OpenAI and create an account and create an API key. The best way to use
OpenAI is to do a "pay as you go" plan and purchase some tokens. Save your API
key to the `pass`

### Emulation
If you've wanted to play games from popular consoles on your computer,
raven-gaming includes many popular emualators.

#### Yuzu
One exception is Yuzu. Copies of Yuzu are hard to come by these days because of
Nintendo's legal battles against it. You may use this

## PDF
The evince program is installed for viewing PDFs.

If you need to sign a pdf or otherwise write on it, use the xournal program.

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

Regardless, this will be legally viewed as "copyright infringement" and you can
expect to get a letter from your ISP if you don't use a VPN and proxy. Raven
comes installed with utilities to avoid this drama. Besides, you paid the
creators already.

Raven-desktop comes installed with mullvad and qbittorrent to assist you.

Create a mullvad account. Mullvad is cheap and has a flat pricing structure, and
is easy to use on raven. Save your account number to `pass`.

Run `mullvad account login` and enter your account number. Then run `mullvad-open`.
This will set the killswitch and open a connection to mullvad.

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
a non-vpn interface, which would be bad.
