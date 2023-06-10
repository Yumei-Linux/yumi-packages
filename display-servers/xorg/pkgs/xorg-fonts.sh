cat > font-7.md5 << "EOF"
ec6cea7a46c96ed6be431dfbbb78f366  font-util-1.4.0.tar.xz
357d91d87c5d5a1ac3ea4e6a6daf833d  encodings-1.0.7.tar.xz
79f4c023e27d1db1dfd90d041ce89835  font-alias-1.0.5.tar.xz
546d17feab30d4e3abcf332b454f58ed  font-adobe-utopia-type1-1.0.5.tar.xz
063bfa1456c8a68208bf96a33f472bb1  font-bh-ttf-1.0.4.tar.xz
51a17c981275439b85e15430a3d711ee  font-bh-type1-1.0.4.tar.xz
00f64a84b6c9886040241e081347a853  font-ibm-type1-1.0.4.tar.xz
fe972eaf13176fa9aa7e74a12ecc801a  font-misc-ethiopic-1.0.5.tar.xz
3b47fed2c032af3a32aad9acc1d25150  font-xfree86-type1-1.0.5.tar.xz
EOF

mkdir -pv ./font ; cd font

grep -v '^#' ../font-7.md5 | awk '{print $2}' | wget -i- -c \
    -B https://www.x.org/pub/individual/font/

md5sum -c ../font-7.md5

echo "[I] Installing xorg-fonts..."
for package in $(grep -v '^#' ../font-7.md5 | awk '{print $2}'); do
  packagedir=${package%.tar.?z*}
  echo "[I] Installing ${packagedir}..."
  tar -xvf $package
  pushd $packagedir
    ./configure $XORG_CONFIG
    _make && _make install
  popd
  rm -rf $packagedir
done

cd ../

install -v -d -m755 /usr/share/fonts
ln -svfn $XORG_PREFIX/share/fonts/X11/OTF /usr/share/fonts/X11-OTF
ln -svfn $XORG_PREFIX/share/fonts/X11/TTF /usr/share/fonts/X11-TTF