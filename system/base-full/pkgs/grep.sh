source grep-3.8
sed -i "s/echo/#echo/" src/egrep.sh
./configure --prefix=/usr
make && make install