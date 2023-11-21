{pkgs, ...}:
let
  pname = "pocketbase";
  version = "v0.19.4";
  bin = "pocketbase";
  outname = "pocketbase";

  # replacement for notify-send
  wsln = pkgs.stdenv.mkDerivation {
    inherit pname version bin outname;

    src = pkgs.fetchzip {
      url = "https://github.com/pocketbase/pocketbase/releases/download/v0.19.4/pocketbase_0.19.4_linux_amd64.zip";
      sha256 = "7LmSpnHPAdT/C5+RWNlCHX26ECTd/9ZVqEAs/G2Tq+0=";
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
    wsln
  ];
}
