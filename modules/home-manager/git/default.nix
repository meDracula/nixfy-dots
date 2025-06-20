#########################
# Home Manager Git Config
#########################
{ lib, config, pkgs, programs, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "enable git config";
    git.userName = lib.mkOption { type = lib.types.str; };
    git.userEmail = lib.mkOption { type = lib.types.str; };
    git.signingKey = lib.mkOption { type = lib.types.str; };
    git.editor = lib.mkOption { type = lib.types.str; };
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable    = config.git.enable;
      userName  = config.git.userName;
      userEmail = config.git.userEmail;
  
      extraConfig = {
        core = { editor = config.git.editor; };
      	init = { defaultBranch = "main"; };
        pull = { rebase = true; };
      };

      signing = {
        key = config.git.signingKey;
        signByDefault = true;
      };
  
      aliases = {
      	# branch
      	b  = "branch";
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
      	co  = "checkout";
      	co0 = "checkout HEAD --";
      
      	# fetch
      	f  = "fetch";
      	fo = "fetch origin";
      
      	# Pull
      	pl = "pull";
      
      	# push
      	ph  = "push";
      	pha = "push --all";
      	pht = "push --tags";
      
      	# merge
      	mr = "merge";
      
      	# rebase
      	re  = "rebase";
      
      	# commit
      	c      = "commit -v";
      	ca     = "commit --all -v";
      	cm     = "commit --message";
      	cam    = "commit --all --message";
      	camend = "commit --amend --reuse-message HEAD";
      	cundo  = "reset --soft 'HEAD^'";
      	cp     = "cherry-pick";
      
      	# diff
      	d  = "diff";
      	ds = "diff --staged";
      	dh = "diff HEAD";
      
      	# index
      	st = "status";
      	r  = "reset";
      
      	# stage
      	a  = "add";
      	ad = "add .";
      
      	# log
      	l  = "log --oneline -n";
      	ls = "log --stat";
      	lh = "shortlog --summary --numbered --email";
      
      	# log graph
      	lg  = "log --graph --oneline";
      	lga = "log --all --graph";
      	lgr = "log --graph --oneline --decorate --date=relative";
      };
    };
  };
}
