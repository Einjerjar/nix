{pkgs, ...}:
{
  home.packages = [
    pkgs.bun
    pkgs.biome
    pkgs.go
    (pkgs.python311.withPackages (p: with p; [
      pip
      numpy
      matplotlib
      pillow
      requests
    ]))
  ];
}
