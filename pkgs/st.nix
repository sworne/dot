{ pkgs, utils, theme, ... }:
let
  customSt = import ../dotfiles/st/default.nix;
  patch = utils.mustache "theme-0.8.5.diff" ../dotfiles/st/theme-0.8.5.diff.mustache theme;
in
{
  home.packages = with pkgs; [
    (customSt.overrideAttrs (oldAttrs: rec { patches = oldAttrs.patches ++ [ patch ]; }))
  ];
}
