let
  pkgs = import <nixpkgs> {};
in {

  home.packages = [
    pkgs.alacritty
    pkgs.font-manager
  ];
}
