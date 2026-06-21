# Inputs

Raven uses forks of nixpkgs and nix-community. The reason is because
of a particular commit in systemd.

Systemd added a field for the user's birthDate. This is an unprecedented
allowance of personal information being integrated into the system level of
conventionally FOSS personal computers.

The only practical use for such a field is as a shared interface
for software applications to request your age from your system. The author
of the [associated PR](https://github.com/systemd/systemd/pull/40954) cites
recent legislation like California's AB-1043 as the motivating factor.

Raven will not entertain the possibility of storing any personal information
at the system level. The operators of nixpkgs are agnostic in this view, so
it is likely this change will eventually find its way into nixpkgs.

This change can be observed by cloning the systemd repository and checking
out a specific commit.

```
$ git clone https://github.com/systemd/systemd.git
$ git checkout acb6624fa19ddd68f9433fb0838db119fe18c3ed
$ grep -rl birthDate

docs/USER_RECORD.md
src/home/homectl.c
src/shared/user-record.c # This is the specific file.
src/test/test-user-record.c
```

The branches on Raven's forks of nixpkgs and nix-community are updated
only after ensuring this problematic commit of systemd does not enter.

The version of systemd referenced by nixpkgs can be determined by grokking
a file within the nixpkgs repository. NixOS 25.05 is used as an example
here because it is end-of-life. It shouldn't receive any new development.

```
# Clone Raven's fork and checkout the branch.
$ git clone https://github.com/digital-raven/nixpkgs.git
$ git checkout nixos-25.05

# Read the file
$ vim ./nixpkgs/pkgs/os-specific/linux/systemd/default.nix
```

This version of nixpkgs calls out version 257.10 of systemd. We can
see that this version does not contain the problematic commit.

```
# No matches for birthDate
$ cd systemd
$ git checkout v257.10
$ grep -rl birthDate
```
