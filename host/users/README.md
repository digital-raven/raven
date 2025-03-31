Modify this directory when creating / removing users from your host.

To create a new user...

1. Decide if you want to create a new master-level or guest-level user and
   copy the appropriate block within [users.nix](./users.nix).
2. If you wish to have a home-manager set up for this new user, then modify
   [flake.nix](../../flake.nix) using the instrucitons there and create a new
   .nix file under ./home-manager similar to the ones already present.
