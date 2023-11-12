# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

let
  user = "nixos";
in {
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ./hardware-configuration.nix

    (import ./stuff { user = user; })
  ];

  # nixos-wsl config
  wsl.enable = true;
  wsl.defaultUser = user;

  # disable windows path to avoid slow autocompletes
  wsl.wslConf.interop.appendWindowsPath = false;

  # enable flakes, had to use to allow for 
  #  https://github.com/nix-community/neovim-nightly-overlay
  #  to work properly with home-manager
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "23.05"; # Did you read the comment?
  system.copySystemConfiguration = true;
}
