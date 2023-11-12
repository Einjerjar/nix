{ pkgs, ... }:
{
  # enable opengl?
  hardware.opengl = {
    enable = true;
    # package = (pkgs.mesa.override { galliumDrivers = [ "i915" "swrast" "d3d12" ]; }).drivers;
    # extraPackages = [ pkgs.mesa.drivers ];
    driSupport = true;
    driSupport32Bit = true;
  };
}
