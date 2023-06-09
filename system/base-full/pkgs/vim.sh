source vim-9.0.1273

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr
_make && _make install

ln -sv vim /usr/bin/vi
for L in /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim90/doc /usr/share/doc/vim-9.0.1273

if [ ! /etc/vimrc ]; then
cat > /etc/vimrc << "EOF"
" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim

let skip_defaults_vim=1
set nocompatible
set backspace=2
set mouse=
syntax on

if (&term == "xterm") || (&term == "putty")
    set background=dark
endif
EOF
fi