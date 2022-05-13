{ pkgs, ... }: {
  programs.bash.profileExtra = "fbsetroot  -fg '#001633' -bg '#000f20' -mod 100 100";
  services = {
    dwm-status.enable = true;
    dwm-status.order = [  "audio" "time" ];
  };
  home.packages = with pkgs; [
    pkgs.fluxbox # for fbsetroot
    (dwm.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ ];
      patches = [
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/uselessgap/dwm-uselessgap-6.2.diff";
          sha256 = "0dx20q8pkbvva5x6xs5q13v2g5mdgrimid52jzrfiwx5f89jarsn";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/pertag/dwm-pertag-6.2.diff";
          sha256 = "042bp41sn8dvjkxnw1bclc268ik6g7cg5qalvx89xpmz5pqs0p85";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/hide_vacant_tags/dwm-hide_vacant_tags-6.2.diff";
          sha256 = "1a3z9f2hd7602857v99hcyiw4sapsl7x5v612azani1plz6l6vbi";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/clientmonoclesymbol/dwm-clientmonoclesymbol-20220417-d93ff48.diff";
          sha256 = "0kpj8kkzga4rm46vqhc30as0dj8dccb7bkmb66yy7d6ry5724lw1";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/restartsig/dwm-restartsig-20180523-6.2.diff";
          sha256 = "0s9gfimv3m233bc9iw8w0j0ma0qank3zxffx5630qasmv90jyky7";
        })
        ./bar-20220510-6.2.diff
        ./keys-20220510-6.2.diff
        ./tags-20220510-6.2.diff
        ./dark-theme-20220510-6.2.diff
      ];
    }))
  ];
}