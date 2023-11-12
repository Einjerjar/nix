{pkgs, ...}:
{
  home.packages = [
    pkgs.curl
    pkgs.wget
    pkgs.unzip

    pkgs.fzf
    pkgs.grc
    pkgs.wslu
    pkgs.direnv
    pkgs.xdg-utils

    pkgs.htop
    pkgs.xclip
    
    pkgs.gnupg
    pkgs.tree

    pkgs.glow
    pkgs.gum
    pkgs.feh
  ];
}
