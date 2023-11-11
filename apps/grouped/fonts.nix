let
  pkgs = import <nixpkgs> {};
in {
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerdfonts
  ];
}
