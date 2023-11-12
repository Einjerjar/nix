{user, ...}:
{
  # allows linger, required for rootless docker
  # https://www.reddit.com/r/NixOS/comments/y1brcg/comment/irx83pm/?utm_source=share&utm_medium=web2x&context=3

  users.users.nixos.extraGroups = [ "networkmanager" "wheel" ];

  systemd.services.linger = {
    enable = true;

    requires = [ "local-fs.target" ];
    after = [ "local-fs.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /run/current-system/sw/bin/loginctl enable-linger ${user}
      '';
    };

    wantedBy = [ "multi-user.target" ];
  };
}
