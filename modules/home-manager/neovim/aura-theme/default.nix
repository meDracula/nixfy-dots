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
      sha256 = "1vxk4mkk72qnp2w60gigl3ran6lhyd4i6j494z3zkina330nvkgq"; # Commit: 6356de2fa2551b9dbc3a7d7b6c5328658353084e
    };
    pluginType = "lua";
  };
  # Make plugin derivation
  aura-theme = pkgs.stdenv.mkDerivation {
    name = "aura-theme";
    src = aura-theme-repo;
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
