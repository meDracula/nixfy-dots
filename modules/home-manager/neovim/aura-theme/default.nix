# Neovim colorscheme Aura theme
# Self-contained plugin derivation
{ pkgs }:

let
  # Fetch the full aura-theme repo
  aura-theme-repo = pkgs.vimUtils.buildVimPlugin {
    pname = "aura-theme";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "daltonmenezes";
      repo = "aura-theme";
      rev = "main";
	  # Command: nix-prefetch-url --unpack https://github.com/daltonmenezes/aura-theme/archive/refs/heads/main.zip
      sha256 = "0lnjnssw1bdfg0gra71954rwx282svz5ca2bb8kgnnzi6z2a143v"; # Commit: 6e4f659e74577cae7cb152a96f84c23bc9213f1b
    };
    pluginType = "lua";
  };
  # Make plugin derivation
  aura-theme = pkgs.stdenv.mkDerivation {
    name   = "aura-theme";
    src    = aura-theme-repo;
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out
      cp -r ${aura-theme-repo}/packages/neovim/* $out/
    '';
  };
in
# Build Home-Manager Nix comptaible Vim Plugin
pkgs.vimUtils.buildVimPlugin {
  pname = "aura-theme";
  version = "main";
  src = aura-theme;
  pluginType = "lua";
}
