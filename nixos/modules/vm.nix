{ ... }:
{
  virtualisation.vmVariant = {
    users.users.tester = {
      isNormalUser = true;
      initialPassword = "tester";
    };
    virtualisation = {
      memorySize = 4096;
      cores = 2;
      diskImage = null;
    };
  };
}
