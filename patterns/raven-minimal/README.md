# Raven-minimal

The raven-minimal pattern is a subset of all other patterns. All
raven patterns include the packages and functionalities
seen in raven-minimal. All terminals across raven installations
behave the same.

Installing raven-minimal first, while an additional step,
effectively streamlines the installation process of all
other raven operating systems for the rest of your life.

And if there is functionality you desire, it is relatively
easy to expand on and modify one of these patterns to suit
your use case. Raven is designed to be straightforward to
modify, but competant out of the box.

## Installation
Get 2 flash drives. Make them good flash drives; you deserve it.
Samsung 128GB are what I prefer. Samsung usually makes good storage.

Plug in both flashdrives to your computer. Install the
[archlive iso](https://archlinux.org/download/) to one of the flash
drives and then boot from it. Then run these commands.

```
pacman -Sy
git checkout https://github.com/digital-raven/raven
cd ./raven/patterns/raven-minimal
archinstall --config ./config.json --creds ./creds.json
```
Install raven-minimal to the other flash drive. This installation works
on any storage media but a large flash drive is the most generally useful.

You will have to do your own disk partitioning. You may encrypt the
installation, and set a custom password for the user. If you modify
anything else that's on you.

When archinstall prompts you to chroot and run any post-install, say
yes and run these commands.

```
cd /home/master/
git clone https://github.com/digital-raven/raven
./raven/patterns/raven-minimal/update init
```

Upon completion, raven-minimal is now properly installed.

## Usage
raven-minimal is just a useful cli experience. The default shell
is bash, and the default user is master, for you are one.

It has useful configurations for bash, zsh, and fish. Each supports
- Good tab auto-complete.
- Package suggestion for missing binaries.
- Good syntax highlighting.
- Unlimited comamnd history.

## Updating raven-minimal
Run the update script in this directory with no arguments.

`~/raven/patterns/raven-minimal/update`

This will update the raven repo, run `yay -Syu` and install
any additional packages added to raven-minimal's default list.
This list is viewable in [conf json](./conf.json)

You can also just run `yay -Syu` if you don't want raven's updates.
