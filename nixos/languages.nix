{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ rustup libgcc python314 ];
}
