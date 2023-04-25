{
  description = "sworne@ dotfiles";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
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
        configuration = import ./roles/sway.nix;
        homeDirectory = home;
        extraSpecialArgs = attrs;
      };
    };
}



