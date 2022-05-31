{ config, pkgs, theme, ... }:
let
  themeType =
    if (theme.type == "dark") then {
      name = "Adwaita-dark";
    } else {
      name = "Adwaita";
    };
in
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = themeType.name;
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = themeType.name;
    };
  };
}
