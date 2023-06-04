TEMP=$(mktemp -d)

if [ -d "./.yumi-downloads" ]; then
    mv -v ./.yumi-downloads/* $TEMP
    rmdir ./.yumi-downloads/
fi

cd $TEMP

into_tar_source () {
    tar -xvf ${@}.tar*
    cd $@
}

cleanup () {
    cd /
    rm -rf $TEMP
}

# configuring make through /etc/yumi/make_opts
if [ ! -d /etc/yumi ]; then
    mkdir -pv /etc/yumi
fi

if [ -f /etc/yumi/make_opts ]; then
    export MAKEOPTS=$(cat /etc/yumi/make_opts)
    alias make="make ${MAKEOPTS}"
    echo " ** CONFIGURING MAKE WITH MAKE_OPTS=${MAKEOPTS}"
fi

# load the builder
. ${@}
