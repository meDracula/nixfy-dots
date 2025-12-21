#########################
# Home Manager AWS Config
#########################
{
  config,
  pkgs,
  programs,
  ...
}:

let
  sessionManagerPlugin = pkgs.callPackage ./session-manager-plugin { };
in
{
  home.packages = with pkgs; [
    awscli2
    sessionManagerPlugin
  ];

  # home.file.".aws/config".text = ''
  # '';
}
