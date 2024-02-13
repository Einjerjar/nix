{ pkgs, lib, ... }:
let
  # stuff copied + referenced directly from
  #  https://github.com/nix-community/nixGL
  #  this is done directly here so we wont need to prepend
  #  nixGL to all gui apps
  mesa-drivers = [ pkgs.mesa.drivers ];

  mesaPath = "${lib.makeLibraryPath mesa-drivers}";
  vdpauPath = "${lib.makeSearchPathOutput "lib" "lib/vdpau" [pkgs.libvdpau-va-gl]}";
  glvndPath = "${lib.makeLibraryPath [ pkgs.libglvnd ]}";
  glxindirect = pkgs.runCommand "mesa_glxindirect" {} (''
    mkdir -p $out/lib
    ln -s ${pkgs.mesa.drivers}/lib/libGLX_mesa.so.0 $out/lib/libGLX_indirect.so.0
  '');
in {
  home.sessionVariables = {
    DISPLAY = "172.27.128.1:0.0";
    NIXPKGS_ALLOW_UNFREE = "1";

    XDG_RUNTIME_DIR = "/run/user/$(id -u)";
    GOPATH = "/home/$(whoami)/ein/go";

    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "wslview";

    # once again, big thanks to nixGL for these stuff
    #  tho its heavily simplified to fit my use case
    __EGL_VENDOR_LIBRARY_FILENAMES = "${pkgs.mesa.drivers}/share/glvnd/egl_vendor.d/50_mesa.json";
    LIBGL_DRIVERS_PATH = "${lib.makeSearchPathOutput "lib" "lib/dri" mesa-drivers}";
    LIBVA_DRIVERS_PATH = "${lib.makeSearchPathOutput "out" "lib/dri" (mesa-drivers)}";
    LD_LIBRARY_PATH = "${mesaPath}:${vdpauPath}:${glxindirect}/lib:${glvndPath}:${pkgs.zlib}/lib";
  };

  home.sessionPath = [
    "/home/$(whoami)/.scripts"
    "/home/$(whoami)/.bun/bin"
    "/home/$(whoami)/ein/go/bin"
    "/home/$(whoami)/.local/bin"
  ];
}
