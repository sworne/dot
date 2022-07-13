{ config, pkgs, ... }: {
  programs = {
    bat = {
      config = {
        theme = "zenburn";
        italic-text = "always";
        paging = "never";
      };
    };
  };
}
