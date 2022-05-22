{ pkgs, ... }: {
  home.packages = with pkgs; [
    (import ../dotfiles/st/default.nix)
  ];
}
