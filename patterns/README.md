A small warning.

It is not expected for raven users to modify anything under this directory patterns.
If you make modifications to the files within this directory then you may experience
merge conflicts if you decide to pull updates from the main raven repository.

It's not **that** big of a deal to make changes here, but these are the files that
differentiate between models offered by Raven.

Raven holds power here.

## Patterns and attachments
A Raven "pattern" represents a flavor of Raven suited for a rough use-case.

- raven-iso: Build along this path to create a bootable ISO.
- raven-minimal: Minimally functional terminal experience.
- raven-terminal: Fatter terminal experience.
- raven-desktop: Full graphical desktop experience.

An "attachment" adds functionality onto a pattern.

Each attachment has a "system" level and a "home-manager" level.

The "gaming" attachment for raven-desktop is a good example. Its "default.nix"
file at its top level is the system evaluation point, and
"home-manager/default.nix" is the home-manager evaluation starting point.

That's all a Raven attachment needs as an interface point; a name,
a top level default.nix file, and a home-manager level default.nix file.

Modify the files, system.nix and home-manager.nix, in a pattern's attachments
directory to select active attachments.
