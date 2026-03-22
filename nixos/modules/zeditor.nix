{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zed-editor-fhs

    # NIX LANGUAGE SUPPORT
    nil
    nixd
  ];
}
