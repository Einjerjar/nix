{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    package = pkgs.picom.overrideAttrs (_: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "ibhagwan";
        rev = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
        sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
      };
    });
    fade = true;

    settings = {
      active-opacity = 1;
      inactive-opacity = 0.8;
      corner-radius = "8";
    };
  };
}
