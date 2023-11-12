{ pkgs, lib, ... }:
let
  mod = "Mod1";
in {
  # https://blog.neerajadhav.in/how-to-install-i3wm-on-nixos-a-step-by-step-guide
  # https://gitlab.com/-/snippets/3601956
  xsession = {
    enable = true;

    windowManager.i3 = {
      enable = true;

      extraConfig = ''
        include ~/.config/i3/extra/init.i3c
      '';

      config = {
        modifier = mod;
        
        fonts = [ "JetBrainsMono Nerd Font Mono" ];

        keybindings = lib.mkOptionDefault {
          "${mod}+Return" = "exec alacritty";

          # Focus
          "${mod}+Shift+h" = "focus left";
          "${mod}+Shift+j" = "focus down";
          "${mod}+Shift+k" = "focus up";
          "${mod}+Shift+l" = "focus right";

          # Move
          "${mod}+Control+h" = "move left";
          "${mod}+Control+j" = "move down";
          "${mod}+Control+k" = "move up";
          "${mod}+Control+l" = "move right";

          # disable this default bind
          "${mod}+h" = "nop";
        };

        bars = [
          {
            position = "top";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3/extra/i3status.toml";
          }
        ];
      };
    };
  };

  home.packages = with pkgs; [
    i3status-rust
    nitrogen
    feh
  ];
}
