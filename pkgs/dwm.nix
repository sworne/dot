{ pkgs, utils, theme, ... }:
let
  customDwm = import ../dotfiles/dwm/default.nix;
  patch = utils.mustache "theme-6.2.diff" ../dotfiles/dwm/theme-6.2.diff.mustache theme;
in
{
  imports = [ ./bg.nix ./sxhkd.nix ];

  services = {
    dwm-status = {
      enable = true;
      order = [ "time" ];
    };
    sxhkd = {
      extraConfig = builtins.readFile ../dotfiles/sxhkd/dwm;
    };
  };
  home.file.dwm-keys = {
    source = ../dotfiles/dwm/keys.md;
    target = ".dwm-keys.md";
  };
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (customDwm.overrideAttrs (oldAttrs: rec { patches = oldAttrs.patches ++ [ patch ]; }))
    glow #dwm keyboard shortuct help
    jetbrains-mono #dwm main font
    material-icons #dwm icon font
    pavucontrol
    scrot
    xfce.thunar
  ];
}
