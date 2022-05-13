{ pkgs, ... }: {
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        ./dark-theme-20220510-0.8.4.diff
        ./font-20220510-0.8.4.diff
        (fetchpatch {
          url = "https://st.suckless.org/patches/anysize/st-anysize-0.8.4.diff";
          sha256 = "1w3fjj6i0f8bii5c6gszl5lji3hq8fkqrcpxgxkcd33qks8zfl9q";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.4.diff";
          sha256 = "0i0fav13sxnsydpllny26139gnzai66222502cplh18iy5fir3j1";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff";
          sha256 = "0z961sv4pxa1sxrbhalqzz2ldl7qb26qk9l11zx1hp8rh3cmi51i";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20200416-5703aa0.diff";
          sha256 = "17avl5bgwlh5ayaqfg01sg9klf828hc0fd36cgzldnl595jyp1yb";
        })
      ];
    }))
  ];
}
