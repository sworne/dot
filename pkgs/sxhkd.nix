{ config, pkgs, ... }: {
  services.sxhkd.enable = true;
  systemd.user.services.sxhkd = {
    Unit = {
      Description = "Per user sxkhd";
      PartOf = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "simple";
      ExecStart = ''${pkgs.sxhkd}/bin/sxhkd'';
      ExecStop = "pkill sxhkd";
    };
  };
}
