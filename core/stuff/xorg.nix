{ pkgs, ... }:
{
  environment.pathsToLink = [ "/libexec" ];
  services = {
    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
        ];
      };
    };
    gvfs.enable = true;
    # gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
      };
      pulse.enable = true;
    };
  };
}
