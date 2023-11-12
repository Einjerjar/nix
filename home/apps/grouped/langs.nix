{pkgs, ...}:
{
  home.packages = [
    pkgs.bun
    pkgs.go
    pkgs.python313
  ];
}
