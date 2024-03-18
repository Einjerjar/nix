let
  pkgs = import <nixpkgs> {};
in {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    extraConfig = {
      credential = {
        credentialStore = "gpg";
        helper = "/home/nixos/.nix-profile/bin/git-credential-manager";
      };
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
        pager = "delta";
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
    pkgs.git-credential-manager
  ];
}
