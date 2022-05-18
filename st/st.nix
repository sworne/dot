{ pkgs, ... }: {
  home.packages = with pkgs; [
    (import ./base.nix)
  ];
}
