{
  description = "Shell nix flake configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      pre-commit-hooks,
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            # Required to install obsidian
            "electron-25.9.0"
          ];
        };
      };

      preCommitCheck = pre-commit-hooks.lib.${system}.run {
        src = ./.;

        hooks = {
          # --- formatting ---
          nixfmt-rfc-style.enable = true;

          # --- whitespace / files ---
          trim-trailing-whitespace.enable = true;
          end-of-file-fixer.enable = true;
          check-executables-have-shebangs.enable = true;

          # --- correctness ---
          check-toml.enable = true;

          # --- secret detection ---
          ripsecrets.enable = true;
          detect-private-keys.enable = true;

          # --- shell ---
          shellcheck.enable = true;
        };
      };
    in
    {
      nixosConfigurations.shell = lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./hosts/shell/configuration.nix
        ];
      };

      homeConfigurations = {
        ghost = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./users/ghost/home-manager/home.nix
          ];
        };
        victor = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./users/victor/home-manager/home.nix
          ];
        };
      };

      checks.${system}.pre-commit = preCommitCheck;
      formatter.${system} = pkgs.nixfmt-rfc-style;

      devShells.${system} = {
        default = pkgs.mkShell {
          name = "Dev Station";
          inputsFrom = [ preCommitCheck ];
          packages = with pkgs; [
            figlet
            pre-commit
            nixfmt-rfc-style
            shellcheck
          ];
          shellHook = ''
            ${preCommitCheck.shellHook}
            echo "Dev Station" | figlet
          '';
        };
      };
    };
}
