source autoconf-2.71

sed -e 's/SECONDS|/&SHLVL|/' \
    -e '/BASH_ARGV=/a\ /^SHLVL=/ d' \
    -i.orig tests/local.at

./configure --prefix=/usr

make && make install