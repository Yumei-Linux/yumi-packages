into_tar_source harfbuzz-7.3.0

mkdir -pv build ; cd build

if [ -f "/usr/bin/gr2fonttest" ]; then
    meson setup --prefix=/usr \
        --buildtype=release \
        -Dgraphite2=enabled \
        ..
else
    meson setup --prefix=/usr \
        --buildtype=release \
        -Dgraphite2=disabled \
        ..
fi

ninja && ninja install