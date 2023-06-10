into_tar_source rsync-3.2.3

groupadd -g 48 rsyncd
useradd -c "rsyncd Daemon" -m -d /home/rsync -g rsyncd \
    -s /bin/false -u 48 rsyncd

./configure --prefix=/usr \
    --disable-lz4 \
    --disable-xxhash \
    --without-included-zlib

_make && _make install