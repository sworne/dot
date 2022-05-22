{ config, ... }: {
    services.redshift = {
        enable = true;
        longitude = config.location.longitude;
        latitude = config.location.latitude;
    };
}