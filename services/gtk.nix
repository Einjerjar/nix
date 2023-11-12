{ pkgs, ...}:
{
  dconf.enable = true;

  # gtk settings
  gtk = {
    enable = true;
  };

  home.packages = with pkgs; [
    gnome.adwaita-icon-theme
    gnomeExtensions.appindicator
    dconf
  ];
}
