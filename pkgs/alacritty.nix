{ pkgs, utils, theme, ... }: let
  customSt = import ../dotfiles/st/default.nix;
  alacritty-conf = utils.mustache "alacritty-conf" ../dotfiles/alacritty/alacritty.yml.mustache theme;
in
{
    xdg.configFile."alacritty/alacritty.yml".source = alacritty-conf;
}