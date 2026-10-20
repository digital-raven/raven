Loader is exclusively for creating a bootable ISO image. This may be
built by using the following command.

```
. ~/raven/.envrc && nix build --impure ~/raven#nixosConfigurations.loader.config.system.build.isoImage
```
