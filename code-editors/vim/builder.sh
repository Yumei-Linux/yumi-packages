into_tar_source vim-9.0.1503

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
echo '#define SYS_GVIMRC_FILE "/etc/gvimrc"' >> src/feature.h

./configure --prefix=/usr \
    --with-features=huge \
    --with-tlib=ncursesw

_make && _make install

ln -snfv ../vim/vim90/doc /usr/share/doc/vim-9.0.1503

rsync -avzcP --exclude="/dos/" --exclude="/spell/" \
    ftp.nluug.nl::Vim/runtime/ ./runtime/

echo "[I] Config files are /etc/vimrc and /etc/gvimrc, /etc/vimrc should already be filled by yumi's system/base-full pkg"