{ config, pkgs, theme, ... }: {
  systemd.user.services.wallpaper = {
    Unit = {
      Description = "Script that sets a wallpaper on user login";
      PartOf = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = ''${pkgs.fluxbox}/bin/fbsetroot -gradient Vertical -from "${theme.black}" -to "${theme.brightBlue}"'';
    };
  };
}
