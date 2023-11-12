{ pkgs, ... }:
{
  # use fish as default shell
  programs.fish.enable = true;
  users.users.nixos.shell = pkgs.fish;
}
