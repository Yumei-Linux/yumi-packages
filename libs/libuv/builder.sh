into_tar_source libuv-v1.45.0
sh autogen.sh
./configure --prefix=/usr --disable-static
_make && _make install