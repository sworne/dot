with import <nixpkgs> { };
(st.overrideAttrs (oldAttrs: rec {
  buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
  patches = [
    (fetchpatch {
      url = "https://st.suckless.org/patches/anysize/st-anysize-0.8.4.diff";
      sha256 = "sha256-2uxCn9HtSM44poIVOPm4YwGXynN50OIE/HcsnW2cHyo=";
    })
    (fetchpatch {
      url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff";
      sha256 = "sha256-ZZAbrWyIaYRtw+nqvXKw8eXRWf0beGNJgoupRKsr2lc=";
    })
    (fetchpatch {
      url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20220127-2c5edf2.diff";
      sha256 = "sha256-CuNJ5FdKmAtEjwbgKeBKPJTdEfJvIdmeSAphbz0u3Uk=";
    })
    (fetchpatch {
      url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20220127-2c5edf2.diff";
      sha256 = "sha256-8oVLgbsYCfMhNEOGadb5DFajdDKPxwgf3P/4vOXfUFo=";
    })
    ./appearance-20220517-0.8.4.diff
  ];
}))
