let
  pkgs = import <nixpkgs> {};
in {
  home.packages = [
    pkgs.neovim
    pkgs.codeium

    # lsp
    pkgs.gopls
    pkgs.emmet-ls
    pkgs.tailwindcss
    pkgs.lua-language-server
    pkgs.vscode-langservers-extracted

    pkgs.nodePackages_latest.pyright
    pkgs.nodePackages_latest.svelte-language-server
    pkgs.nodePackages_latest.typescript-language-server

    # linters
    pkgs.selene
    pkgs.nodePackages_latest.eslint

    # formatters
    pkgs.stylua
    pkgs.gofumpt
    pkgs.gotools
    pkgs.golines
  ];
}
