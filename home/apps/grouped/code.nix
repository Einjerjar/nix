{pkgs, ...}:
let
  pname = "odoo-lsp";
  version = "v0.2.1";
  bin = "odoo-lsp";
  outname = "odoo-lsp";

  # replacement for notify-send
  odoo-lsp = pkgs.stdenv.mkDerivation {
    inherit pname version bin outname;

    src = pkgs.fetchzip {
      url = "https://github.com/Desdaemon/odoo-lsp/releases/download/v0.2.1/odoo-lsp-x86_64-unknown-linux-musl.tgz";
      sha256 = "yEit05H45lHSva/40Ak40vLMVWn4wMPB0W8Y7xA0G4I=";
      stripRoot = false;
    };

    installPhase = ''
      mkdir -p $out/bin;
      cp $bin $out/bin/$outname;
      chmod +x $out/bin/*
    '';
  };
in {
  home.packages = [
    pkgs.neovim
    pkgs.codeium
    pkgs.nodejs_21
    pkgs.nodePackages_latest.pnpm

    # lsp
    odoo-lsp
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
    pkgs.nodePackages_latest.eslint     # js/ts
    pkgs.ruff                           # python
    pkgs.ruff-lsp                       # python

    # formatters
    pkgs.stylua
    pkgs.gofumpt
    pkgs.gotools
    pkgs.golines
    pkgs.nodePackages_latest.prettier   # html, css, js+
    pkgs.black                          # python
    pkgs.isort                          # python
  ];
}
