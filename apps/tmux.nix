with import <nixpkgs> {};

let
  t = tmuxPlugins.mkTmuxPlugin {
    pluginName = "t";
    rtpFilePath = "t-smart-tmux-session-manager.tmux";
    version = "0.2";
    src = fetchFromGitHub {
      owner = "joshmedeski";
      repo = "t-smart-tmux-session-manager";
      rev = "01b60128b4bebeedd7dc3a4b95d3257f70d4a417";
      sha256 = "0l+2ZRj9knjDRUiGePTt14UxrI0FNVHIdIZtKZs8bek=";
    };
  };
in {
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.mode-indicator
      tmuxPlugins.sensible
      t
    ];

    extraConfig = ''
      source-file ~/.config/tmux/config/_init.tmux.conf
    '';
  };

  programs.fish.interactiveShellInit = ''
    fish_add_path ${t}/share/tmux-plugins/t/bin/
  '';

  home.packages = [
    pkgs.gitmux
  ];
}
