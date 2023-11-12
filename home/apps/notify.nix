{pkgs, ...}:
let
  pname = "wsl-notify-send";
  version = "v0.1.871612270";
  bin = "wsl-notify-send.exe";
  outname = "notify-send";

  # replacement for notify-send
  wsln = pkgs.stdenv.mkDerivation {
    inherit pname version bin outname;

    src = pkgs.fetchzip {
      url = "https://github.com/stuartleeks/wsl-notify-send/releases/download/v0.1.871612270/wsl-notify-send_windows_386.zip";
      sha256 = "haG8zYNCH6Qm/U9eUDkWHZLqjkAsHf1n4wnO6BZpqzY=";
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
