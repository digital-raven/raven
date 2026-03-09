This core represents the bare-bones overhead added by raven-core.
These are tools to necessary to operate the Raven repository.

You may also copy-paste this file to create a new attachment.

- `cp -r` this directory to the `attachments` directory in the target pattern.
- Rename it to whatever you like.
- Gut `default.nix` and `home-manager/default.nix` and remove other files.
- Edit the `system.nix` and `home-manager.nix` files of the target pattern
  to import your new attachment.

An attachment may have system and home-manager components. Place system level
files in the attachment's root alongside default.nix.

Components related to home-manager are down a level.

```
./raven-core/
├── core
│   ├── default.nix # System-level entrypoint.
│   ├── home-manager
│   │   └── default.nix    # Home-manager entrypoint.
│   └── README.md          # This file.
├── home-manager.nix       # imports core/home-manager
└── default.nix            # Imports core
```

Here's an example for a hypothetically more complicated attachment.

```
./raven-desktop/attachments/
├── browsers             # Browsers attachment
│   ├── brave.nix          # Installs brave.
│   ├── default.nix        # System entrypoint; Just imports.
│   ├── firefox.nix        # Installs firefox.
│   └── home-manager
│       ├── brave.nix        # Configures brave.
│       ├── default.nix      # Home-manager entryponit; Just imports.
│       └── firefox.nix      # Configures firefox.
├── home-manager.nix     # imports browsers/home-manager
└── system.nix           # Imports browsers
```
