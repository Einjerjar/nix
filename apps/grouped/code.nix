let
  pkgs = import <nixpkgs> {};
in {
  home.packages = [
    pkgs.neovim
    pkgs.codeium

    pkgs.lua-language-server
    pkgs.nodePackages_latest.pyright
  ];
}
