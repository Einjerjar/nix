{pkgs, ...}:
{
  home.packages = [
    pkgs.alacritty
    pkgs.font-manager

    # too used to it to let go
    pkgs.microsoft-edge
  ];
}
