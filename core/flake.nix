{
  description = "flaky?";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixos-wsl.url = "https://github.com/nix-community/NixOS-WSL/archive/refs/heads/main.tar.gz";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    # nixpkgs.url = "nixpkgs/nixos-23.05";
    # unstable.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
