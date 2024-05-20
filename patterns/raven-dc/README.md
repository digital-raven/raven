# Raven Development Container

The raven-dc is a development container. It allows you to deploy raven
on any environment with docker.

## Installation and use
Create the raven-dc image locally with the following commands and then
exexute it with the `raven-dc` script.

```
make
./raven-dc
```

From there back up the container however you wish.

The following lists the main tools provided by the raven-dc and the manual
steps you need to change them.

## Shells
The raven-dc provides pretty good preset configurations for bash,
and zsh. They add some pretty good creature comforts to the command line.
bash is the default shell, but you may change it after your first login
with `chsh -s /usr/bin/zsh`

These configs have things you care about.
- Unlimited command history.
- Graphical select of reverse command search.
- Avoid modifying the output of core utils like `cat` and `ls` which means
  it's easier to script inside your interactive shell.
- Installed Handymans tools.
- 

Stuff you bring to every installation.
- Easy integration with pass-tomb, but the tomb, tomb's key, and
  pgp key are on you!
- docker is pre-configured, but you need to login.
- NordVPN is pre-setup, but 
- Easy instructions for rclone config storage

## Vim
Run `vim -c PlugInstall` the first time you run vim in the container.
Run `:PlugUpdate` from vim to update the plugins when you wish.

This also installs the vim-ai plugin, so if you type in `:AI hello`,
then you will see a response if your OPENAI\_API\_KEY environment
variable is set. There's an easy to see point in 
