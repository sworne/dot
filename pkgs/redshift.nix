{ config, secrets, ... }: {
    services.redshift = {
        enable = true;
        latitude = import "${secrets.outPath}/home/latitude";
        longitude = import "${secrets.outPath}/home/longitude";
    };
}