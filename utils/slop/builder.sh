into_git_source https://github.com/naelstrof/slop.git slop

cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release ./

_make && _make install
