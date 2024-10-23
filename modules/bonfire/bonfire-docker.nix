{config, pkgs, ...}:{
  virtualisation.docker.enable = true;
  users.users.david.extraGroups = [ "docker" ];
}
