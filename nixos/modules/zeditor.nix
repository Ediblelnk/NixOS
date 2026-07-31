{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zed-editor-fhs

    # NIX LANGUAGE SUPPORT
    nil
    nixd

    # ruby lsp
    rubyPackages.ruby-lsp
    rubyPackages.rubocop
  ];
}
