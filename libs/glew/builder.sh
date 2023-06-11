tar -xvf ./glew-2.2.0.tgz
cd ./glew-2.2.0

sed -i 's%lib64%lib%g' config/Makefile.linux

sed -i -e '/glew.lib.static:/d' \
       -e '/0644 .*STATIC/d' \
       -e 's/glew.lib.static//' Makefile

_make && _make install.all
