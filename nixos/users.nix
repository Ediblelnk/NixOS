{ config, pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;
  users.users.edibleink = {
    isNormalUser = true;
    description = "Peter Schaefer";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [ ];
    hashedPassword =
      "$y$j9T$8AO8ltVx38vcEPJoherlg0$cgwf4NXcWF6kysZaACQifPUqLbVMqnICehyyaS1hDa8";
  };

  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  services.fprintd.enable = true;
}
