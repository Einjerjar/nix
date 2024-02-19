{ user, ... }:
{
  imports = [
    ./docker.nix
    ./firewall.nix
    ./opengl.nix
    ./openssh.nix
    ./secrets.nix
    ./shell.nix
    ./xorg.nix

    (import ./user.nix { user = user; })
  ];
}
