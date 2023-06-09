into_tar_source git-2.41.0

./configure --prefix=/usr \
    --with-gitconfig=/etc/gitconfig \
    --with-python=python3

_make && _make html
_make perllibdir=/usr/lib/perl5/5.36/site_perl install
_make htmldir=/usr/share/doc/git-2.41.0 install-html