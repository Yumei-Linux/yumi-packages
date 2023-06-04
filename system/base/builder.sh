ROOT=/var/yumi/system/base

source () {
    cd /sources
    tar -xvf ./${@}.tar*
    cd ${@}
}

load () {
    . $ROOT/pkgs/${@}
}

packages=(
    gettext.sh
)

for pkg in ${packages[@]}; do
    echo "** COMPILING ${pkg} [BASE]..."
    sleep 1
    load $pkg
done