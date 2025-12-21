###################
# Home Manager Rofi
###################
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # app launchers
    rofi
  ];

  xdg.configFile."rofi".source = ./rofi;
}
