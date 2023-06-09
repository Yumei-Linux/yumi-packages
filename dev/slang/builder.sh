into_tar_source slang-2.3.3

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-readline=gnu

make -j1

make install_doc_dir=/usr/share/doc/slang-2.3.3 \
     SLSH_DOC_DIR=/usr/share/doc/slang-2.3.3/slsh \
     install &&

chmod -v 755 /usr/lib/slang/v2/modules/*.so