{ pkgs, ... }: {
  mustache = name: template: data:
    pkgs.stdenv.mkDerivation {
      name = "${name}";
      nativeBuildInpts = [ pkgs.mustache-go ];
      phases = [ "buildPhase" "installPhase" ];

      passAsFile = [ "jsonData" ];
      jsonData = builtins.toJSON data;

      buildPhase = ''
        ${pkgs.mustache-go}/bin/mustache $jsonDataPath ${template} > rendered_file
      '';

      installPhase = ''
        cp rendered_file $out
      '';
    };
}
