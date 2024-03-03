#########################
# Home Manager Git Config
#########################
{ config, pkgs, programs, ... }:

{
  programs.git = {
    enable = true;
    userName = "meDracula";
    userEmail = "me.dracula@protonmail.com";

    extraConfig = {
      core = { editor = "nvim"; };
    	init = { defaultBranch = "main"; };
      pull = { rebase = true; };
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
}
