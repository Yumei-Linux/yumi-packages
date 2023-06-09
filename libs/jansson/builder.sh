into_tar_source jansson-2.14

sed -e "/DT/s;| sort;| sed 's/@@libjansson.*//' &;" \
    -i test/suites/api/check-exports

./configure --prefix=/usr \
    --disable-static

_make && _make install