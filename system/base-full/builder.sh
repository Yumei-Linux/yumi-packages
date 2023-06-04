ROOT=/var/yumi/system/base-full

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
    man-pages.sh
    iana-etc.sh
    glib.sh
)

for pkg in ${packages[@]}; do
    echo "** COMPILING ${pkg} [BASE FULL]..."
    sleep 1
    load $pkg
done