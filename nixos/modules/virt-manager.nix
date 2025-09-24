{ config, pkgs, ... }: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "edibleink" ]; # <- remember to change this to your user
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
