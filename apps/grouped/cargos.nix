let
  pkgs = import <nixpkgs> {};
in {
  home.packages = [
    pkgs.fd
    pkgs.bat
    pkgs.lsd
    pkgs.vivid
    pkgs.delta
    pkgs.zoxide
    pkgs.sccache
    pkgs.du-dust
    pkgs.ripgrep
    pkgs.macchina
    pkgs.tealdeer
  ];
}
