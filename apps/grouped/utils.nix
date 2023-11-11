let
  pkgs = import <nixpkgs> {};
in {
  home.packages = [
    pkgs.curl
    pkgs.wget
    pkgs.unzip

    pkgs.wslu
    pkgs.xdg-utils
    pkgs.fzf
    pkgs.grc

    pkgs.htop
    pkgs.xclip
    
    pkgs.gnupg
    pkgs.tree

    pkgs.glow
    pkgs.gum
  ];
}
