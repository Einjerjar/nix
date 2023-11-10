let
  pkgs = import <nixpkgs> {};
in {
  programs.fish = {
    enable = true;
    plugins = [
      { 
        name = "tmux.fish";
        src = pkgs.fetchFromGitHub {
          owner = "budimanjojo";
          repo = "tmux.fish";
          rev = "df5a050c81807cc72c45e87ec72bf6461c318c73";
          sha256 = "Z6fIPtYnyUEbVYHZtWNJ4W7l50P2xa3XYuENuz3zNiU=";
        };
      }
    ];
  };

  home.packages = [
    pkgs.fishPlugins.fzf-fish
    pkgs.fishPlugins.forgit
    pkgs.fishPlugins.grc
  ];
}
