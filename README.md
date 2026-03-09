# Raven

Raven is an operating system. It's a product that you can apply to a block of
computing hardware and then run software applications.

Raven's implementation attempts to maximize commitment in these areas.

- Clear documentation for expected uses.
- Non-technical and power users are each first-class citizens.
- Good taste in provided software.
- Mechanical transparency. Raven may be completely understood from this respository.
- Authority and responsibility are assumed by the user.
- Dress nice with conveniences and sleek UI out of the box.

But there is an unbreakable rule of the universe; Compromises are unavoidable
in any engineering or design effort. Any compromises are made in the name of
optimizing the above commitments.

<img src="logo.png" width="256" height="256">

If your computer has annoyed you, then the Raven operating system may be for you.

## General Usage and Understanding

Raven is part operating system and part guide. In its default state it serves
as a Seal of Approval of sorts; pointing to quality providers to reduce your
computer to a low input of respectful software.

Raven is implemented as a Nix Flake. This means when you install Raven onto
your computer it is configured by manipulating the text files within your
system's local copy of this repository.

This implementation has several advantages, such as providing an avenue to the
user for trivial re-creation of their computing environment on a fresh machine
starting from only their GitHub account. This also allows a Raven user to
operate independently of its developer. Your machine is safe from tampering;
even from us.

There are 2 general approaches to using Raven. Exact installation instructions
are provided in the [user-guide](./docs/user-guide.md).

A flashdrive with Raven pre-installed from the developer.

1. Purchase a flashdrive from the developer.
2. When you receive it, plug it in an select it as your boot device.
3. Your machine's settings will then be manipulated from the local copy of
   this repository in the `/home/master/raven-machines` directory.

Or you can install it yourself to one of your own drives.

1. Create a GitHub account.
2. Fork this repository to your account as a private repo.
3. Boot a computer into NixOS and clone your private repo to it.
4. Use the `raven-configure` script to change the necessary `REPLACEME`
   placeholders.
5. Raven is capable of overwriting an existing NixOS installation or
   targeting a specific drive. The `raven-configure` script will assist you.

## What to expect

Raven has some expectations of its user, though they are not onerous.

- Raven's user understands what a file-system and storage devices are.
- Read the [user-guide](./docs/user-guide.md).
- Raven does not claim to be a performant OS, but it should get the job done
  for home office, gaming, and various development tasks.
- Raven should be about as secure as any operating system can reasonably be.
  We get our security updates at the same time as everyone else.
- What you see is what you get. Being based on NixOS, Raven suppors full and
  exact software auditability.
  
## Compelling features

Raven allows you to operate independently, but you may choose to reference
this repo for guidance and updates.

- Competant configurations for office, gaming, or software development out of the box.
- Easy starting point to a configurable NixOS system as a flake.
- Update when / if you want.
- Raven provides instruction on how to live without us, even if you're not
  a technical user. Grab this repo and fly in your own direction, if you wish.
- Easy access to otherwise hard to get programs.
- Long list of quality software and guides for common tasks in the
  on-system [user-guide](./docs/user-guide.md).
- Easy experimentation. Each modification to your system produces a snapshot of the
  previous configuration. If you make a change you don't like then you can reboot
  your machine and load your old setup.

## For commercial use

The files in the repository are GPLv2 licensed software. You may use Raven under an
altered license by asking permission first. Email raven@rubicon.aleeas.com
