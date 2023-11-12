{pkgs, ...}:
{
  fonts.fontconfig.enable = true;

  # yes
  home.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
  ];
}
