{ config, pkgs, theme, ... }: {
  imports = [ ../dotfiles/gtk/default.nix ];

  gtk.enable = true;
}
