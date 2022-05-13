{ ... }: {
    services.picom = {
        enable = true;
        extraOptions = builtins.readFile ./picom.conf;
    };
}