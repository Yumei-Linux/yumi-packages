ROOT=/var/yumi/system/base-full

source () {
    cd /sources
    test -d ${@} && rm -rvf ${@}
    tar -xvf ./${@}.tar* || exit 1
    cd ${@}
}

load () {
    . $ROOT/pkgs/${@} || exit 1
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
    pkg-config.sh
    ncurses.sh
    sed.sh
    psmisc.sh
    gettext.sh
    bison.sh
    grep.sh
    bash.sh
    libtool.sh
    gdbm.sh
    gperf.sh
    expat.sh
    inetutils.sh
    less.sh
    perl.sh
    xml-parser.sh
    intltool.sh
    autoconf.sh
    automake.sh
    openssl.sh
    kmod.sh
    libelf.sh
    libffi.sh
    python.sh
    wheel.sh
    ninja.sh
    meson.sh
    coreutils.sh
    check.sh
    diffutils.sh
    gawk.sh
    findutils.sh
    groff.sh
    gzip.sh
    iproute2.sh
    kbd.sh
    libpipeline.sh
    make.sh
    patch.sh
    tar.sh
    texinfo.sh
    vim.sh
    markupsafe.sh
    jinja2.sh
    systemd.sh
    dbus.sh
    mandb.sh
    procps-ng.sh
    util-linux.sh
    e2fsprogs.sh
)

for pkg in ${packages[@]}; do
    echo "** COMPILING ${pkg} [BASE FULL]..."
    sleep 1
    load $pkg
done