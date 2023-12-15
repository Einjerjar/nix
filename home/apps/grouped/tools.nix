{pkgs, ...}:
{
  home.packages = [
    # should prolly move this to code.nix
    # pkgs.pocketbase
    pkgs.code-minimap
    pkgs.flyctl
    pkgs.lighttpd
  ];
}
