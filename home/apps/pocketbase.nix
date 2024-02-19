{pkgs, ...}:
let
  pname = "pocketbase";
  version = "0.21.3";
  bin = "pocketbase";
  outname = "pocketbase";

  # replacement for notify-send
  pb = pkgs.stdenv.mkDerivation {
    inherit pname version bin outname;

    src = pkgs.fetchzip {
      url = "https://github.com/pocketbase/pocketbase/releases/download/v${version}/pocketbase_${version}_linux_amd64.zip";
      sha256 = "sha256-WJR45ZRjTmIi5DiOSFffLIwBOfqSupyTN2IaFybUMeo=";
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
