{ pkgs, utils, theme, ... }:
let
  sway-theme = utils.mustache "sway-theme" ../dotfiles/sway/theme.mustache theme;
  sway-apps = utils.mustache "sway-apps" ../dotfiles/sway/apps.mustache {
    term = "foot";
    browser = "google-chrome --enable-features=UseOzonePlatform --ozone-platform=wayland";
    menu = "foot -a Run -e run";
    music = "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland";
  };
in
{
  #wayland.windowManager.sway.enable = true;
  xdg.configFile = {
    "sway/config".source = pkgs.lib.mkForce ../dotfiles/sway/config;
    "sway/config.d/apps".source = sway-apps;
    "sway/config.d/keys".source = ../dotfiles/sway/keys;
    "sway/config.d/theme".source = sway-theme;
  };
}
