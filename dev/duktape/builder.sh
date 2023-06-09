into_tar_source duktape-2.7.0
sed -i 's/-Os/-O2/' Makefile.sharedlibrary
_make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr
_make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr install