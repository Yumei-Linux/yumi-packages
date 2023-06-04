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
    glibc.sh
    zlib.sh
    bzip2.sh
    xz.sh
    zstd.sh
    file.sh
    readline.sh
    m4.sh
    bc.sh
    flex.sh
    tcl.sh
    expect.sh
    dejagnu.sh
    binutils.sh
    gmp.sh
    mpfr.sh
    mpc.sh
    attr.sh
    acl.sh
    libcap.sh
    shadow.sh
    gcc.sh
)

for pkg in ${packages[@]}; do
    echo "** COMPILING ${pkg} [BASE FULL]..."
    sleep 1
    load $pkg
done