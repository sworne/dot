{ config, pkgs, ... }: {
  imports = [ ../dotfiles/alacritty/default.nix ];
  
  programs.alacritty.enable = true;
}