into_tar_source vim-9.0.1503

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
echo '#define SYS_GVIMRC_FILE "/etc/gvimrc"' >> src/feature.h

echo "[Q] Do you want --enable-gui=gtk3? [y/N] "
read wantsgtk

if [[ "$wantsgtk" != 'y' && "$wantsgtk" != 'n' && "$wantsgtk" != "" ]]; then
    echo "* Invalid answer, put y or n. Retry building."
    exit 1
fi

echo "wantsgtk -> $wantsgtk"

if [[ "$wantsgtk" == "y" ]]; then
    echo "[I] Configuring with --enable-gui=gtk3"
    exit 1
    ./configure --prefix=/usr \
        --with-features=huge \
        --enable-gui=gtk3 \
        --with-tlib=ncursesw
else
    echo "bad"
    exit 1
    ./configure --prefix=/usr \
        --with-features=huge \
        --with-tlib=ncursesw
fi

_make && _make install

ln -snfv ../vim/vim90/doc /usr/share/doc/vim-9.0.1503

rsync -avzcP --exclude="/dos/" --exclude="/spell/" \
    ftp.nluug.nl::Vim/runtime/ ./runtime/

make -C src installruntime &&
vim -c ":helptags /usr/share/doc/vim-9.0.1503" -c ":q"

echo "[I] Config files are /etc/vimrc and /etc/gvimrc, /etc/vimrc should already be filled by yumi's system/base-full pkg"