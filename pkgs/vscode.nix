{ config, pkgs, ... }: {
  home.packages = [ pkgs.nixpkgs-fmt pkgs.diffutils pkgs.gopls pkgs.black ];
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        arcticicestudio.nord-visual-studio-code
        dbaeumer.vscode-eslint
        dracula-theme.theme-dracula
        golang.go
        haskell.haskell
        jnoortheen.nix-ide
        naumovs.color-highlight
        naumovs.color-highlight
        tobiasalthoff.atom-material-theme
        viktorqvarfordt.vscode-pitch-black-theme
        vscode-extensions.ms-python.python
        yzhang.markdown-all-in-one
        zhuangtongfa.material-theme
      ];
    };
  };
}
