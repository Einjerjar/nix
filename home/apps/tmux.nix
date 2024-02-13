{pkgs, ...}:
let
  # switch between named sessions based on directory
  t = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "t";
    rtpFilePath = "t-smart-tmux-session-manager.tmux";
    version = "0.2";
    src = pkgs.fetchFromGitHub {
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

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode   # sounded cool on paper, but idk
      tmuxPlugins.vim-tmux-navigator  # make life less painful
      tmuxPlugins.mode-indicator
      tmuxPlugins.sensible
      tmuxPlugins.net-speed
      t
    ];

    # source our custom configs
    extraConfig = ''
      source-file ~/.config/tmux/config/_init.tmux.conf
    '';
  };

  # doesn't get added by default, not sure why
  programs.fish.interactiveShellInit = ''
    fish_add_path ${t}/share/tmux-plugins/t/bin/
  '';

  home.packages = [
    pkgs.gitmux
  ];
}
