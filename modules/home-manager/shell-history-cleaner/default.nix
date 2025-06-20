#######################
# Shell Histroy Cleaner
#######################
{ config, pkgs, ... }:

let
  cleanupScript = ''
    #!/bin/sh
    echo "INFO: Clearing shell histroy..."
    > ~/.zsh_history
    > ~/.bash_history
    echo "INFO: Shell histroy cleared on $(date) " >> ~/.cleanup_history.log
  '';
in {
  # Save the script to ~/.local/bin
  home.file.".local/bin/sh-cleanup-histories.sh" = {
    executable = true;
    text = cleanupScript;
  };

  # Define the systemd user service
  systemd.user.services."sh-cleanup-histories" = {
    Unit = {
      Description = "Clear bash and zsh histroy files";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${config.home.homeDirectory}/.local/bin/sh-cleanup-histories.sh";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  # Define the timer to run it monthly
  systemd.user.timers."sh-cleanup-histories" = {
    Unit = {
      Description = "Monthly cleanup of shell history files";
    };
    Timer = {
      OnCalendar = "monthly";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
