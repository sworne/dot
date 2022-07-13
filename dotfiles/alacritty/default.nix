{ pkgs, utils, theme, ... }: let
  alacritty-conf = utils.mustache "alacritty-conf" ./alacritty.yml.mustache theme;
in
{
    xdg.configFile."alacritty/alacritty.yml".source = alacritty-conf;
}