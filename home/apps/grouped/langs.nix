{pkgs, ...}:
{
  home.packages = [
    pkgs.bun
    pkgs.biome
    pkgs.go
    pkgs.python311
    pkgs.python311Packages.pip
  ];
}
