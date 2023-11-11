let
  pkgs = import <nixpkgs> {};
in {
  home.packages = [
    pkgs.neovim
    pkgs.codeium
    pkgs.nodejs_21
    pkgs.nodePackages_latest.pnpm

    # lsp
    pkgs.gopls
    pkgs.emmet-ls
    pkgs.marksman                       # markdown
    pkgs.lua-language-server
    pkgs.tailwindcss-language-server
    pkgs.vscode-langservers-extracted   # html, css, js

    pkgs.nodePackages_latest.pyright
    pkgs.nodePackages_latest.svelte-language-server
    pkgs.nodePackages_latest.typescript-language-server

    # linters
    pkgs.selene                         # lua
    pkgs.nodePackages_latest.eslint

    # formatters
    pkgs.stylua
    pkgs.gofumpt
    pkgs.gotools
    pkgs.golines
    pkgs.nodePackages_latest.prettier   # html, css, js+
  ];
}
