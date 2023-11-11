{
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    DISPLAY = "192.168.80.1:0.0";

    XDG_RUNTIME_DIR = "/run/user/$(id -u)";
    GOPATH = "/home/$(whoami)/ein/go";

    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.sessionPath = [
    "/home/$(whoami)/.scripts"
    "/home/$(whoami)/.bun/bin"
    "/home/$(whoami)/ein/go/bin"
  ];
}
