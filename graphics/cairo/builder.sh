into_tar_source cairo-1.17.6

sed 's/PTR/void */' -i util/cairo-trace/lookup-symbol.c

sed -e "/@prefix@/a exec_prefix=@exec_prefix@" \
    -i util/cairo-script/cairo-script-interpreter.pc.in

./configure --prefix=/usr \
    --disable-static \
    --enable-tee

_make && _make install