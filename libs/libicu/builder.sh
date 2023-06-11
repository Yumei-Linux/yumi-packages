tar -xvf ./icu4c-73_1-src.tgz
cd icu/source
./configure --prefix=/usr
_make && _make install
