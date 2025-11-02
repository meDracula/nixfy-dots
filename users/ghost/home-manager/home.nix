{ config, pkgs, programs, ... }:

{
  imports = [
    ../../../modules/home-manager/git
    ../../../modules/home-manager/zellij
    ../../../modules/home-manager/lf
    ../../../modules/home-manager/kubernetes
    ../../../modules/home-manager/kubernetes/talos
    ../../../modules/home-manager/terraform
    ../../../modules/home-manager/neovim
    ../../../modules/home-manager/taskwarrior
  ];

  home = {
    username = "ghost";
    homeDirectory = "/home/ghost";

    packages = with pkgs; [
      # File manager
      lf

      # Terminal utils
      fzf
      fd
      jq
      yq
      bat
      ripgrep
      neofetch
      starship

      # Applications
      obsidian

      # Fonts
      fira-code
    ];

    stateVersion = "25.05";
  };

  git = {
    enable = true;
    userName = "meDracula";
    userEmail = "me.dracula@protonmail.com";
    signingKey = "879713EE65B0D884";
    editor = "nvim";
  };

  programs.zsh = {
    enable = true;

    autocd = true; # change directory just by typing its name
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      path = "${config.home.homeDirectory}/.zsh_history";
      size = 1000; # HISTFILE: Number of history lines to keep
      save = 2000; # HISTSIZE: Number of history lines to save
      expireDuplicatesFirst = true; # delete duplicates first when HISTFILE size exceeds HISTSIZE
      ignoreAllDups = true; # ignore duplicated commands history list
      ignoreSpace = true; # ignore commands that start with space
    };

    sessionVariables = {
      EDITOR = "nvim"; # Editor Neovim
      LS_COLORS = "$LS_COLORS:ow=30;44:"; # fix ls color for folders with 777 permissions
      # LF
      LF_BOOKMARK_PATH = "${config.home.homeDirectory}/.config/lf/bookmarks.txt";
      # Bat
      BAT_THEME = "ansi";
      # FZF default command
      FZF_DEFAULT_COMMAND = "fd --type f --hidden -E .git/";
      FZF_DEFAULT_OPTS = "--keep-right --layout=default --border=rounded --height=~20 --scheme=path";
    };

    shellAliases = {
      # Auto Color
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      diff = "diff --color=auto";
      ip = "ip --color=auto";
      # ls
      ll = "ls -alh";
      la = "ls -A";
      l = "ls -CF";
      # XClip
      clip = "xclip -sel clip";
      yoink = "xclip -sel clip";
      # Bat
      batf = "bat $(fd --type f --hidden -E .git/ | fzf --keep-right --layout=default --border=rounded --height=~20 --scheme=path)";
      # Git
      gtr = "cd $(git rev-parse --show-toplevel)";
    };

    initExtraFirst = ''
      # Set Options
      setopt autocd              # change directory just by typing its name
      #setopt correct            # auto correct mistakes
      setopt interactivecomments # allow comments in interactive mode
      setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
      setopt nonomatch           # hide error message if there is no match for the pattern
      setopt notify              # report the status of background jobs immediately
      setopt numericglobsort     # sort filenames numerically when it makes sense
      setopt promptsubst         # enable command substitution in prompt
    '';

    initExtra = ''
      # Configure key keybindings
      bindkey -e                                        # emacs key bindings
      bindkey ' ' magic-space                           # do history expansion on space
      bindkey '^U' backward-kill-line                   # ctrl + U
      bindkey '^[[3;5~' kill-word                       # ctrl + Supr
      bindkey '^[[3~' delete-char                       # delete
      bindkey '^[[1;5C' forward-word                    # ctrl + ->
      bindkey '^[[1;5D' backward-word                   # ctrl + <-
      bindkey '^[[5~' beginning-of-buffer-or-history    # page up
      bindkey '^[[6~' end-of-buffer-or-history          # page down
      bindkey '^[[H' beginning-of-line                  # home
      bindkey '^[[F' end-of-line                        # end
      bindkey '^[[Z' undo                               # shift + tab undo last action

      # lf quit change directory
      lfcd () {
          # `command` is needed in case `lfcd` is aliased to `lf`
          cd "$(command lf -print-last-dir "$@")"
      }

      cdf() {
          local dir
          dir=$(fd --type directory --hidden -E .git/ | FZF_DEFAULT_OPTS="--keep-right --layout=default --border=rounded --height=~20 --scheme=path" fzf)
          [[ -n "$dir" ]] && cd "$dir"
      }

      cdp() {
        cd ${config.home.homeDirectory}/Projects
        cdf
      }

      bindkey -s '^o' '^ulfcd\n'
      bindkey -s '^k' '^ukubectx\n'

      # Required for working with gpg in terminal
      export GPG_TTY=$(tty)

      # Starship
      eval "$(starship init zsh)"
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;
}
