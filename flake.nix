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
  };

  outputs = { self, nixpkgs, home-manager }@inputs:
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
    in {
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
  };
}
