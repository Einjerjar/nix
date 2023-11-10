let
  pkgs = import <nixpkgs> {};
in {
  home.packages = [
    pkgs.bun
    pkgs.go
    pkgs.python313
  ];
}
