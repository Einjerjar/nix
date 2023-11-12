{pkgs, ...}:
{
  services.pass-secret-service = {
    enable = true;
  };

  home.packages = [
    pkgs.pass
  ];
}
