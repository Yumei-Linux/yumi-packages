into_tar_source git-2.41.0

./configure --prefix=/usr \
    --with-gitconfig=/etc/gitconfig \
    --with-python=python3

_make && _make perllibdir=/usr/lib/perl5/5.36/site_perl install

tar -xf ../git-manpages-2.41.0.tar.xz \
    -C /usr/share/man --no-same-owner --no-overwrite-dir

mkdir -vp   /usr/share/doc/git-2.41.0 &&
tar   -xf   ../git-htmldocs-2.41.0.tar.xz \
      -C    /usr/share/doc/git-2.41.0 --no-same-owner --no-overwrite-dir &&

find        /usr/share/doc/git-2.41.0 -type d -exec chmod 755 {} \; &&
find        /usr/share/doc/git-2.41.0 -type f -exec chmod 644 {} \;