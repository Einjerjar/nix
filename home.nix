{ config, pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  programs.home-manager.enable = true;

  imports = [
    ./home/apps
    ./home/services
    ./home/vars.nix
  ];
}
