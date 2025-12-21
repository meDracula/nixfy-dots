#############
# User: Ghost
#############
{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    ghost.enable = lib.mkEnableOption "enable user ghost";
  };

  config = lib.mkIf config.ghost.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.ghost = {
      description = "ghost a terminal lover user";
      isNormalUser = true;
      # initialPassword = soap
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      shell = pkgs.zsh;
    };
  };
}
