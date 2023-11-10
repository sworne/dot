{ utils, theme, ... }: let
  config = utils.mustache "config" ../dotfiles/swaylock/config.mustache theme;
in
{
    xdg.configFile."swaylock/config".source = config;
}