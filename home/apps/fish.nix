{pkgs, ...}:
let
  lib = pkgs.lib;
  tmux_fish = { 
      name = "tmux.fish";
      src = pkgs.fetchFromGitHub {
        owner = "budimanjojo";
        repo = "tmux.fish";
        rev = "df5a050c81807cc72c45e87ec72bf6461c318c73";
        sha256 = "Z6fIPtYnyUEbVYHZtWNJ4W7l50P2xa3XYuENuz3zNiU=";
      };
    };
in {
  programs.fish = {
    enable = true;

    # override default shell aliases, this overrides this only for the fish shell
    #  and allows us to not have to deal with configuration.nix
    shellAliases = {
      l = "lsd -lah";
      ls = "lsd -l";
      ll = "lsd -l";
    };

    plugins = [
      # allows fish to run on top of tmux by default
      tmux_fish
    ];
  };

  home.packages = [
    pkgs.fishPlugins.fzf-fish   # fzf integration, yay
    pkgs.fishPlugins.forgit     # shorter git commands + helpers
    pkgs.fishPlugins.grc        # colorize some actions, eg; ps, cool stuff
  ];
}
