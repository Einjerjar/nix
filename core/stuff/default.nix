{ user, ... }:
{
  imports = [
    ./docker.nix
    ./firewall.nix
    ./opengl.nix
    ./shell.nix
    # ./wayland.nix
    ./xorg.nix

    (import ./user.nix { user = user; })
  ];
}
