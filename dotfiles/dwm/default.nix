with import <nixpkgs> { };
(dwm.overrideAttrs (oldAttrs: rec {
  buildInputs = oldAttrs.buildInputs ++ [ ];
  patches = [
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/alwayscenter/dwm-alwayscenter-20200625-f04cac6.diff";
      sha256 = "sha256-xQEwrNphaLOkhX3ER09sRPB3EEvxC73oNWMVkqo4iSY=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/centeredwindowname/dwm-centeredwindowname-20180909-6.2.diff";
      sha256 = "sha256-LJrQ78d5g1f8ibXeSHcWZXXJvm4ozWbArAzbzUjV7ro=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/steam/dwm-steam-6.2.diff";
      sha256 = "sha256-f3lffBjz7+0Khyn9c9orzReoLTqBb/9gVGshYARGdVc=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/bar_height/dwm-bar-height-6.2.diff";
      sha256 = "sha256-GZPOv8ETG3dcGk6nOItF0aPFlKs1Lyk6Y1sPjFQAyNc=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/pertag/dwm-pertag-6.2.diff";
      sha256 = "sha256-8DmooU16+TGu+BzUzxdlbYaB12HSae/RO7fGfsC8IHM=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/hide_vacant_tags/dwm-hide_vacant_tags-6.2.diff";
      sha256 = "sha256-xhDetg4T0v2QStkEYqVTrjQdJUYCeq/OEPDGTqDW9dk=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/taglabels/dwm-taglabels-hide_vacant_tags_funcionality-6.2.diff";
      sha256 = "sha256-ahS7K2o5snufXMUcc9CFGrXBpU4HeqF59UKBHIqtAMo=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/clientmonoclesymbol/dwm-clientmonoclesymbol-20220417-d93ff48.diff";
      sha256 = "sha256-02DGMkwlHm47wDhzQPNpIbZ6FiuO70gz4dTwgTUWRGs=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/cyclelayouts/dwm-cyclelayouts-20180524-6.2.diff";
      sha256 = "sha256-iAoOIrK6knnJ3bdTGovjYiX0zjiyauxXY/6/5vhzB/k=";
    })
    (fetchpatch {
      url = "https://dwm.suckless.org/patches/dwmc/dwm-dwmc-6.2.diff";
      sha256 = "sha256-tHUQeHxxww87iW/dSzcgzFi4afPd67a8Wm8xtSO7vHE=";
    })
    ./keys-20220611-6.2.diff
    ./appearance-20220517-6.2.diff
    ./cyclelayout-dwmc-20220517-6.2.diff
    ./rules-20220517-6.2.diff
  ];
  postPatch = "chmod +x dwmc";
}))
