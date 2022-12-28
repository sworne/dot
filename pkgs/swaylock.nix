{ config, pkgs, lib, theme, ... }: {
  home.packages = with pkgs; [ swaylock ];
  programs.swaylock.settings = {
    color = theme.black;
    font-size = 24;
    indicator-idle-visible = false;
    indicator-radius = 100;
    line-color = theme.white;
    show-failed-attempts = true;
  };
  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 600; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
    ];
  };
}
