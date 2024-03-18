{pkgs, ...}:
let
  pname = "pocketbase";
  version = "0.22.4";
  bin = "pocketbase";
  outname = "pocketbase";

  # replacement for notify-send
  pb = pkgs.stdenv.mkDerivation {
    inherit pname version bin outname;

    src = pkgs.fetchzip {
      url = "https://github.com/pocketbase/pocketbase/releases/download/v${version}/pocketbase_${version}_linux_amd64.zip";
      sha256 = "sha256-MkVOmrNKx2lv5LB9SPzx1KPrart4gjq3Cn735HXhAmA=";
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
