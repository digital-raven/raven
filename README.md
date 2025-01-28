# Raven

The Raven project is two things.

In short, it's an operating system. It's a product that you can apply to a
block of computing hardware and then use software applications on it.

In long, what's the actual point of caring about an operating system?

Because an operating system determines what programs you use, and programs are
made by people, and these people are employed by you. The people you employ and
listen to determine who talks to you. You don't like it when someone speaks without
meaning something real, right? Wouldn't it be nice to fire those people?

This product is the operating system answer to that question. If your computer has
annoyed you, either because of growing blocks of subscriptions you wish you could
live without, or advertisements on a product you paid for, then the Raven operating
system can help you meaningfully, and respectfully, use your computer.

Raven is part operating system, and part guide. It lets you cut through the hype
of various products and hire the teams of people who actually care enough to be
good at their programming jobs. It is a collection tools and a Seal of Approval
of quality providers that simplifies your computer to the lowest possible cost
of using software and feeling respected while you do so.

Raven's claims are...
- The target customer is a non-technical user, competent enough at most computer
  tasks,
- By no means does Raven claim hyper-optimization, but it should get the job done
  for home office, gaming, sofware development.
- This product teaches you how to live without me, even if you're not a technical
  user. All software requires updates, common sense, and treating the user
  themselves as the God of their system.

  Raven teaches you to have that, but you can conveniently reference this repo
  for up-to-date guidance if you're a non-technical user.

- This product can be obtained from me in ways that are free-of-charge with my
  blessing. It's GPLV2 licensed. Share it, back it up, modify it, or create a copy
  and sell to your friends yourself. I won't be mad or get in the way. 
- Raven, when used as guided, is more secure and hygenic than the Windows operating
  system and, in many ways, makes using your computer a quiet experience.
- Raven's author is more or less married to this operating system and its
  providers. I personally deploy this product on all my home computers.

This software and the techniques in this guide are used by me personally on a daily
basis

<img src="logo.png" width="256" height="256">

Raven is a respectful and competant operating system. Raven is offered
as a product with respect to your time and money.

The operating systems provided are designed to instantly turn any computer
into a reasonbly configured machine for the intended use.

The Raven project allows you to instantly recreate your desktop computing
environment on any new machine starting from only your github account and an
internet connection.

## Why use Raven?

- Easy starting point to a configurable NixOS system.
- Competant configurations for office, gaming, or software development.
- Update when / if you want.
- Easy access to otherwise hard to get programs.
- Long list of quality software and guides for common tasks.
- On-system [user-guide][./user-guide.md].
- Customizability with snapshots. If you make a change you don't like then
  you can easily reboot and load your old setup.

## Installing
It is my belief that non-technical users who are tired of annoying desktop
operating systems stand to benefit the most from adopting Raven. Installing
Raven is a bit involved, but only a bit.

1. If you don't have one already, create a github account.
2. Fork this repository to your own account.
3. Download and install the NixOS ISO to a flashdrive.
  - [Rufus](https://rufus.ie/en/) can create a bootable flash drive if you're on Windows.
4. Reboot your computer from your flash drive and go through the NixOS installer.
5. Download your forked repository from your github and run through the update
   procedure below.

## Updating

Raven is simple to update once installed. There are only a few commands to
remember. The 2 main ones are...

- Rebuild your your system with any changes you've made, or perform a first-time installation.
  `sudo nixos-rebuild switch --flake .#raven-gaming`

- Update your home-manager
  `home-manager switch --flake .#master@raven-gaming`

If you wish to get updates for currently installed software, then run the
following command and repeat the above 2.
- `nix flake update`

If you wish to get updates from the main Raven repository then you'll need to add its remote
to your local copy. This is optional, as once you have your own fork you can easily be on
your own.

- `git remote add upstream https://github.com/digital-raven/raven.git`

Then to get updates from the Raven repository...
- `git fetch upstream`
- `git merge upstream/master`
