{ pkgs, ... }: {
  imports = [ ./default.nix ];
  home.packages = with pkgs; [
    signal-cli
    bitwarden-cli
  ];
}
