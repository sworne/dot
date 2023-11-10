{ pkgs, utils, theme, ... }: let
  foot-ini = utils.mustache "foot-ini" ../dotfiles/foot/foot.ini.mustache theme;
in
{
    xdg.configFile."foot/foot.ini".source = foot-ini;
}