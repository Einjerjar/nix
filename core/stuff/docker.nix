{
  # enable rootless docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # add user to docker group anyways despite being rootless
  users.users.nixos.extraGroups = [ "docker" ];
}
