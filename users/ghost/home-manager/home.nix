{ inputs, outputs, pkgs, ... }:

{
  imports = [
    ../../../modules/git
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

      # kubernetes
      talosctl
      kubectl
      kubectx

      # Gothenburg Bit Factory Setup
      taskwarrior
      taskwarrior-tui
      timewarrior
    ];

    stateVersion = "25.05";
  };

  git = {
    enable = true;
    userName = "meDracula";
    userEmail = "me.dracula@protonmail.com";
    editor = "nvim";
  };
}
