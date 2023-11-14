{ user, ... }:
{
  imports = [
    ./docker.nix
    ./firewall.nix
    ./opengl.nix
    ./openssh.nix
    ./shell.nix
    ./xorg.nix

    (import ./user.nix { user = user; })
  ];
}
