let
  pkgs = import <nixpkgs> {};
in {
  home.packages = [
    pkgs.pocketbase
  ];
}
