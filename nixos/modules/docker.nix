{ ... }:
{
  virtualisation.docker.enable = true;
  users.users.edibleink.extraGroups = [ "docker" ];
}
