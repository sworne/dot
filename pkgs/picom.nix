{ ... }: {
    services.picom = {
        enable = true;
        extraOptions = builtins.readFile ../dotfiles/picom/picom.conf;
    };
}