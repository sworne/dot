{ config, ... }: {
    services.screen-locker = {
        enable = true;
        inactiveInterval = 15;
        lockCmd = "\${pkgs.xsecurelock}/bin/xsecurelock";
    };
}