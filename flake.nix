{
  description = "sworne@ hm config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/sworne/sec.git?ref=main";
      flake = false;
    };
  };

  outputs = { home-manager, secrets, ... }@attrs:
    let
      system = "x86_64-linux";
      username = "sworne";
      home = builtins.readFile "${secrets.outPath}/homedir";
    in
    {
      roles = builtins.listToAttrs (map
        (name: {
          name = (builtins.replaceStrings [ ".nix" ] [ "" ] name);
          value = import (./roles + "/${name}");
        })
        (builtins.attrNames (builtins.readDir ./roles)));

      pkgs = builtins.listToAttrs (map
        (name: {
          name = (builtins.replaceStrings [ ".nix" ] [ "" ] name);
          value = import (./pkgs + "/${name}");
        })
        (builtins.attrNames (builtins.readDir ./pkgs)));


      homeConfigurations.non-nix = home-manager.lib.homeManagerConfiguration {
        inherit system username;
        configuration = import ./roles/dwm.nix;
        stateVersion = "21.11";
        homeDirectory = home;
        extraSpecialArgs = attrs;
      };
    };
}



