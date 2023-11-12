{pkgs, ...}:
{
  # ended up on its own file, since this are the stuff
  #  I usually cargo quickinstall
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
