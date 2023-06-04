ROOT=/var/yumi/system/base

source () {
    cd /sources
    test -d ${@} && rm -rvf ${@}
    tar -xvf ./${@}.tar* || exit 1
    cd ${@}
}

load () {
    . $ROOT/pkgs/${@}
}

packages=(
    gettext.sh
    bison.sh
    perl.sh
    python.sh
    texinfo.sh
    util-linux.sh
)

for pkg in ${packages[@]}; do
    echo "** COMPILING ${pkg} [BASE]..."
    sleep 1
    load $pkg
done