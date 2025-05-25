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
      ctpv # File previewer

      # Editors
      neovim

      # Terminal utils
      fzf
      fd
      bat
      ripgrep
      neofetch
      starship

      # Multiplexor
      zellij

      # Applications
      obsidian

      # Gothenburg Bit Factory Setup
      taskwarrior
      taskwarrior-tui
      timewarrior
    ];

    stateVersion = "25.05";
  };
}
