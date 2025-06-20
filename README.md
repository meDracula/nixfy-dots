# Nixfy dots

Is a nixos configration dotfiles.

## Upgrade Nix with Flake to new stable
### New Channel
A [Nix Channel](https://nixos.wiki/wiki/Nix_channels) is the name for the lastes verfied git commits in the Nixpkgs repository.
> **NOTE**: Each channel has a different definition of what "verified" means.

Upgrade/Replace a channel start by first listing it, for a final santity check as always:
```sh
$ sudo nix-channel --list
```
After that replace the channel by using the flag `--add`:
```sh
$ sudo nix-channel --add https://nixos.org/channels/nixos-<stable version> nixos
```
Now if one where to list again it will be the new provide stable channel.

### Nix Configuration
Edit the `configuration.nix` file of the `system.stateVersion` value to the new stable release.
After being edit a upgrade can be started to rebuild with the new system version.
```sh
$ sudo nixos-rebuild --flake /etc/nixos#profile --upgrade
```
> **NOTE**: The Flake lock will prevent any changes on the package level upgrade.

### Flake Lock upgrade
Nix flake requires to upgrade the lock file and then rebuild the system after that.
```sh
$ cd /etc/nixos
$ nix flake update
$ sudo nixos-rebuild --flake /etc/nixos#profile --upgrade
```

## Nix Clean up
To clean up from old unsued nix store paths from store the command `nix-collect-garbage` should be used.

To understand how much will be deleted before running use:
```sh
$ sudo nix-collect-garbage --delete-old --dry-run
```
This will simulate the deletion with the dry run option of the option `--delete-old` specifies the deletion of old store paths that are no longer used by any current generation.
It targets and removes clutter resulting from software updates and deletions.

To execute the nix clean up, just remove the `--dry-run`:
```sh
$ sudo nix-collect-garbage --delete-old
```
