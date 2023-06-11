into_tar_source feh-3.10
sed -i "s:doc/feh:&-3.10:" config.mk
_make PREFIX=/usr && _make PREFIX=/usr install
