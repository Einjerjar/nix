# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "virtio_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/mnt/wsl" =
    { device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/usr/lib/wsl/drivers" =
    { device = "none";
      fsType = "9p";
    };

  fileSystems."/usr/lib/wsl/lib" =
    { device = "none";
      fsType = "overlay";
    };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3226de42-87ef-4f1e-ba15-bff617fa69b3";
      fsType = "ext4";
    };

  fileSystems."/mnt/c" =
    { device = "drvfs";
      fsType = "9p";
    };

  fileSystems."/mnt/g" =
    { device = "drvfs";
      fsType = "9p";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/be929d2f-acec-405e-a914-2a79aba7eea1"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.bonding_masters.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;
  # networking.interfaces.podman1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
