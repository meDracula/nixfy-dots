##########################
# Home Manager Taskwarrior
##########################
{
  config,
  pkgs,
  programs,
  ...
}:

let
  # Timewarrior work together using an on-modify hook script for Taskwarrior.
  # Link: https://timewarrior.net/docs/taskwarrior/
  timewarriorHook = pkgs.fetchurl {
    # Match up tags with timewarrior version installed
    url = "https://raw.githubusercontent.com/GothenburgBitFactory/timewarrior/refs/tags/v1.8.0/ext/on-modify.timewarrior";
    sha256 = "c1d59848d4d9a416513b8a99bd6ab5dbffd6d559ec66bb41c3c7111920d1a463";
  };
  timewarriorHookScript = pkgs.writeScript "on-modify.timewarrior" (
    builtins.readFile timewarriorHook
  );
in
{
  home.packages = with pkgs; [
    taskwarrior3
    taskwarrior-tui
    timewarrior
  ];

  # Install the hook into ~/.task/hooks/
  home.file.".task/hooks/on-modify.timewarrior".source = "${timewarriorHookScript}";
}
