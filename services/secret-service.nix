let
  pkgs = import <nixpkgs> {};
in {
  services.pass-secret-service = {
    enable = true;
  };

  home.packages = [
    pkgs.pass
  ];
}
