#############################
# User: victor (frankenstein)
#############################
{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    victor.enable = lib.mkEnableOption "enable user victor";
  };

  config = lib.mkIf config.ghost.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.ghost = {
      description = "victor frankenstein a og mad scientist";
      isNormalUser = true;
      # initialPassword = soap
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      shell = pkgs.zsh;
    };
  };
}
