{ pkgs, utils, theme, ... }:
let
  customDwm = import ../dotfiles/dwm/default.nix;
  patch = utils.mustache "theme-6.2.diff" ../dotfiles/dwm/theme-6.2.diff.mustache theme;
  sxhkd = utils.mustache "dwm-sxhkd" ../dotfiles/sxhkd/dwm.mustache {
     term = "alacritty";
     browser = "firefox";
     };
in
{
  imports = [ ./wallpaper.nix ./sxhkd.nix ];

  services = {
    dwm-status = {
      enable = true;
      order = [ "time" ];
    };
    sxhkd = {
      extraConfig = sxhkd;
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
  ];
}
