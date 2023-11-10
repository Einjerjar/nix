let
  pkgs = import <nixpkgs> {};
in {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    
    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
      init = {
        defaultBranch = "main";
      };
      commit = {
        gpgsign = true;
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      core = {
        page = "delta";
        editor = "nvim";
      };
      merge = {
        tool = "vimdiff";
      };
      delta = {
        navigate = true;
        light = false;
      };
    };
  };

  home.packages = [
    pkgs.libsecret
  ];
}
