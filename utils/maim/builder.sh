into_git_source https://github.com/naelstrof/maim maim

cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ./

_make && _make install
