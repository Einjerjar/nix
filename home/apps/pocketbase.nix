{pkgs, ...}:
let
  pname = "pocketbase";
  version = "0.20.0";
  bin = "pocketbase";
  outname = "pocketbase";

  # replacement for notify-send
  pb = pkgs.stdenv.mkDerivation {
    inherit pname version bin outname;

    src = pkgs.fetchzip {
      url = "https://github.com/pocketbase/pocketbase/releases/download/v${version}/pocketbase_${version}_linux_amd64.zip";
      sha256 = "vaieBOmLNzRxnO19aVrSL56g2L8bRvb731OwnfQNrck=";
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
    pb
  ];
}
