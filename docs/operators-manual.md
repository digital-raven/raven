# Operator's Manual

Raven is an operating system implemented as a Nix flake.
It should be user-friendly to an experienced user.

Raven comes with a local clone of the [Raven repository](https://codeberg.org/digital-raven/raven).
All system management is performed by editing the files
under 3 main sub-directories.

- `main-system`: Machine-specifics. Hostname, drivers, users, pattern choice...
- `parts-store`: Re-usable parts.
- `patterns`: Ready-to-go starter builds.

There are 3 pre-existing patterns.

- `harness`: Beautiful desktop environment. Slick media machine. Can run Crysis.
- `terminus`: Full-course terminal experience.
- `loader`: Installation ISO.

Changes are made by editing the files and rebuilding the system.

```
# eg. Add a new package
vim ./main-system/system-packages.nix
git add . && git commit
sudo nixos-rebuild switch --flake .#main-system
```

## Operator Requirements

Raven is designed for an experienced operator, though advanced concepts are
not required. Know basic `bash` and `git`. `vim` is the text-editor of
preference on Raven.

## Download and Install

Flash drives with Raven installed are available for sale.
Free DIY installation is supported.

Download and install [the ISO](https://u.pcloud.link/publink/show?code=kZBbSbJZQc13p2DQvc5tYwKLJKGag7S15nPk) to a flashdrive.

- Rufus can create a bootable flash drive if you're on Windows.
- `dd` for Mac or Linux users.

  `sudo dd if=raven-*.iso of=/dev/<flashdrive block device>`

Boot from the flash drive. The user auto-logs.

An internet connection is required for installation.

```
nmcli radio wifi on
nmcli device wifi connect <network-name> --ask
install-raven
```

`install-raven` fetches the repository and runs `raven-configure`.
`raven-configure` replaces template placeholders interactively.

A short series of customized commands will be printed when
done configuring. Enter them manually to complete installation.
These commands perform disk formatting and final installation.

### Troubleshooting

Run `./raven-configure --check` to list the entries in the files you need
to replace. Each has a comment on what to do.

## First Login

Default login username is `master` password `master`. Change password with
`passwd`.

## Desktop Controls

**Main 3**

- ALT+[WTF]: Open web-browser, terminal window, or file-explorer.

**Window Controls**

- SUPER+C: Close window
- SUPER+[JKHL↓↑←→]: Change window focus.
- SUPER+SHIFT+[JKHL↓↑←→]: Move window around.
- SUPER+LEFT_CLICK: Move window with mouse.
- SUPER+RIGHT_CLICK: Resize window with mouse.
- SUPER+V: Flip window orientation.

**Workspace Navigation**

- 3-finger swipe for touchpads.
- CTRL+[K↑]: Workspace overview.
- CTRL+[HL←→]: Navigate workspace.
- CTRL+SHIFT+[HL←→]: Move active window to different workspace.

**Desktop Utils**

- SUPER: Program Launcher
- SUPER+W: Wallpaper select
- CTRL+ALT+S: Screengrab
- CTRL+ALT+C: Colorpicker

**Terminal Controls**

- Shell: Bash
- CTRL+SHIFT+T: New tab.
- CTRL+SHIFT+D: Detach tab.

## Individual Machine Management

The Raven repository has template entries which `raven-configure`
replaces. Other changes for an individual machine may be necessary.
eg. Monitor settings for multi-monitor setups.

Use `git` to manage these changes from their own branch, ideally from
one commit. Use `git rebase -i` to keep machine-specific changes down to
one commit for easier management.

```
git checkout -b hostname
git add .
git commit -m "hostname settings"
```

Apply edits by rebuilding the system.

```
cd ~/raven
sudo nixos-rebuild switch --show-trace --flake .#main-system
```

## User Accounts

The default admin username is "master". This user has sudo access.
Use `passwd` to change the login password.

Users may be added and removed from the system by modifying
`main-system/users/default.nix`. Add new users to home-manager too.

## Updating

Fetch and apply changes from upstream

```
git checkout my-machine
git fetch upstream
git rebase -i upstream/master  # Apply user changes on-top of Master.
sudo nixos-rebuild switch --flake .#main-system
```

## Installing new software

New software may be installed for a specific machine by editing
`main-system/system-packages.nix`

```
environment.systemPackages = with pkgs; [
  zeal # Zeal is a python documentation tool.
];
```

Nixpkgs is the world's largest software repository at time of writing. Most
software will be available there.

- [Official NixOS package search](https://search.nixos.org/packages)
- [Home-manager options search](https://home-manager-options.extranix.com/)

## Installing old software

If a package has been removed from the main repositories of NixOS then
it may not be trivial to install it.

But software from older versions of NixOS should remain operable and specific
versions can be preserved.

This website allows a user to search older NixOS versions for any package, and
will print the command to install and run that software.

- [Search NixOS packages from all NixOS versions](https://lazamar.co.uk/nix-versions/)

## Unfree Software

Unfree software may be enabled. Make the edits as shown below and rebuild
the system.

```
# main-system/configuration.nix
nixpkgs.config.allowUnfree = true;

# patterns/harness/default.nix
# Uncomment to install unfree software
../../parts-store/unfree

# parts-store/unfree/default.nix
# Uncomment modules to install
imports = [
  ./steam.nix
];
```

## Switching to nixpkgs

Raven uses the developer's own fork of nixpkgs to fetch software.
[This helps avoids upstream developer dramas](./inputs.md).

The local installation may be modified to use nixpkgs own repos
instead if the user wishes.

Change the input URLs in `flake.nix`. Then run `nix flake update`
and rebuild the system.

```
nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
home-manager.url = "github:nix-community/home-manager/release-25.05";
disko.url = "github:nix-community/disko/v1.13.0";
```

### Version Locking

It is possible to lock down a package to a specific version. The following
example locks waybar to version 0.12.0 in order to avoid a bug with wildcard
includes introduced in 0.13.0.

```
{
  config,
  pkgs,
  ...
}: let
  pkgs_waybar_0_12_0 =
    import (pkgs.fetchFromGitHub {
      owner = "nixos";
      repo = "nixpkgs";
      rev = "7282cb574e0607e65224d33be8241eae7cfe0979";
      hash = "sha256-hYKMs3ilp09anGO7xzfGs3JqEgUqFMnZ8GMAqI6/k04=";
    }) {
      inherit (pkgs) system;
    };
in {
  # Specific version of waybar
  programs.waybar = {
    enable = true;
    package = pkgs_waybar_0_12_0.waybar;
  };
}
```

## Changing Themes

Theming is performed via [Harnessed](https://github.com/digital-raven/harnessed.git).

Follow the instructions in `parts-store/harnessed/home-manager/default.nix`
to an already-provided theme.

## Creating Themes

Clone or fork the [Harnessed repository](https://github.com/digital-raven/harnessed.git)
and follow its instructions. Should be pretty simple to copy an
existing theme / harness. Start from the `nixos-*` branch which
matches Raven's nixpkgs in `flake.nix`.

Change `flake.nix` to point to the root of your copy as the input.
Then modify at will. Save changes using `git`.

```
# eg. If saved locally
harnessed.url = "/home/master/harnessed/"
harnessed.inputs.nixpkgs.follows = "nixpkgs";
```

## Garbage Collection

NixOS keeps references from previous generations.

It will also keep packages around that are no longer referenced by the system
enclosure. eg. Any software installed via `nix-shell -p`

These eventually require garbage collection.

```
nix-collect-garbage -d # Delete all old generations of profiles.
sudo nix-collect-garbage -d # Delete system-level garbage.
sudo nix-collect-garbage -d [period] # Delete system generations older than [period].
                                     # This can be something like "7d". -d on its own
                                     # will remove all previous generations.
nix-store --optimize -vv # Optimize storage by linking identical packages.
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old # Delete old boot generations.
home-manager expire-generations "+1day" # Clean home-manager
```

## Fleet Operation

Create a private repo for your machines and create a git branch for
a new machine when you install Raven to it. This makes it easy to keep
machine-specific information easily separated.

There is a spot in the repo for allowed public ssh keys.

## Data Security and Credential Management

[Here's a security overview](./data-fortress.md).

But it boils down to...

- [Offline password management](./pass.md)
- [Trustworthy third-party email with aliases](./email.md)
- [Encrypted storage](./encryption.md)

## Web-browsing

[Firefox with tweaked settings](../parts-store/firefox/README.md).
LibreWolf is available as a commented-out alternative.

## Video Games

[Emulators for various consoles](./emulators.md) and 
[launchers for digital libraries](./gaming.md) are supported.

If your goal is commercial and off-she-shelf, then enabling unfree
software will be required.

## Office and Document Utilities

- `libreoffice`: FOSS answer to MS Office.
- `evince`: Read PDF.
- `xournalpp`: Edit PDF.

There's also examples of printer drivers in the `office` directory.

If you need to append pdf files together then you can use the qpdf program.
Here is an example which appends one pdf to another and saves the result.

```
qpdf first.pdf second.pdf -- out.pdf
```

You can also convert markdown files to pdf easily with the following command.
```
pandoc example.md -o example.pdf
```

### Crypto currencies

[Raven doesn't support crypto currencies by default](./cryptocurrencies.md).
