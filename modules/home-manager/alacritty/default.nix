########################
# Home Manager Alacritty
########################
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile."alacritty/alacritty.toml".source = ./alacritty.toml;
}
