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
  ];

  # nixos-wsl config
  wsl.enable = true;
  wsl.defaultUser = user;
  # disable windows path to avoid slow autocompletes
  wsl.wslConf.interop.appendWindowsPath = false;

  # use fish as default shell
  programs.fish.enable = true;
  users.users.nixos.shell = pkgs.fish;

  # enable rootless docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # add user to docker group anyways despite being rootless
  users.users.nixos.extraGroups = [ "docker" ];

  # enable flakes, had to use to allow for 
  #  https://github.com/nix-community/neovim-nightly-overlay
  #  to work properly with home-manager
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # allow ports for docker and stuff
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPorts = [ 80 443 ];
  };

  # allows linger, required for rootless docker
  # https://www.reddit.com/r/NixOS/comments/y1brcg/comment/irx83pm/?utm_source=share&utm_medium=web2x&context=3
  systemd.services.linger = {
    enable = true;

    requires = [ "local-fs.target" ];
    after = [ "local-fs.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /run/current-system/sw/bin/loginctl enable-linger ${user}
      '';
    };

    wantedBy = [ "multi-user.target" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
