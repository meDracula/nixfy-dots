{ inputs, outputs, pkgs, ... }:

{
  imports = [
    ../../programs/git.nix
  ];

  home = {
    username = "ghost";
    homeDirectory = "/home/ghost";

    packages = with pkgs; [
      # File manager
      lf

      # Editors
      neovim

      # Terminal utils
      fzf
      bat
      ripgrep
      neofetch
      starship

      # Applications
      obsidian
    ];

    stateVersion = "23.11";
  };
}
