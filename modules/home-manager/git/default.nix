#########################
# Home Manager Git Config
#########################
{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    git.enable = lib.mkEnableOption "enable git config";
    git.userName = lib.mkOption { type = lib.types.str; };
    git.userEmail = lib.mkOption { type = lib.types.str; };
    git.signingPubFile = lib.mkOption { type = lib.types.str; };
    git.editor = lib.mkOption { type = lib.types.str; };
    git.allowedSignersFile = lib.mkOption { type = lib.types.str; };
  };

  config = lib.mkIf config.git.enable {

    home.packages = with pkgs; [
      mob # Tool for smoth git handover
    ];

    programs.git = {
      enable = config.git.enable;

      settings = {
        user = {
          name = config.git.userName;
          email = config.git.userEmail;
        };

        core.editor = config.git.editor;
        init.defaultBranch = "main";
        pull.rebase = true;

        gpg.ssh.allowedSignersFile = config.git.allowedSignersFile;

        alias = {
          # branch
          b = "branch";
          bc = "checkout -b";
          bl = "branch -v";
          bL = "branch -av";
          bd = "branch -d";
          bD = "branch -D";
          bm = "branch -m";
          bM = "branch -M";
          bs = "show-branch";
          bS = "show-branch -a";

          # checkout
          co = "checkout";
          co0 = "checkout HEAD --";

          # fetch
          f = "fetch";
          fo = "fetch origin";

          # Pull
          pl = "pull";

          # push
          ph = "push";
          pha = "push --all";
          pht = "push --tags";

          # merge
          mr = "merge";

          # rebase
          re = "rebase";

          # commit
          c = "commit -v";
          ca = "commit --all -v";
          cm = "commit --message";
          cam = "commit --all --message";
          camend = "commit --amend --reuse-message HEAD";
          cundo = "reset --soft 'HEAD^'";
          cp = "cherry-pick";

          # diff
          d = "diff";
          ds = "diff --staged";
          dh = "diff HEAD";

          # index
          st = "status";
          r = "reset";

          # stage
          a = "add";
          ad = "add .";

          # log
          l = "log --oneline -n";
          ls = "log --stat";
          lh = "shortlog --summary --numbered --email";

          # log graph
          lg = "log --graph --oneline";
          lga = "log --all --graph";
          lgr = "log --graph --oneline --decorate --date=relative";
        };
      };

      signing = {
        format = "ssh";
        key = config.git.signingPubFile;
        signByDefault = true;
      };
    };
  };
}
