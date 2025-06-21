#######################
# Home Manager Talos OS
#######################
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    talosctl
  ];
}
