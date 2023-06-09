TEMP=$(mktemp -d)

if [ -d "./.yumi-downloads" ]; then
    mv -v ./.yumi-downloads/* $TEMP
    rmdir ./.yumi-downloads/
fi

cd $TEMP

into_tar_source () {
    tar -xvf ${@}.tar* || exit 1
    cd $@
}

into_zip_source () {
    mkdir -pv ${@}.extracted
    cd ${@}.extracted
    unzip ../${@}.zip || exit 1
}

cleanup () {
    cd /
    rm -rf $TEMP
}

# configuring make through /etc/yumi/make_opts
if [ ! -d /etc/yumi ]; then
    mkdir -pv /etc/yumi
fi

_make () {
    if [ -f /etc/yumi/make_opts ]; then
        echo "* Calling make with $(cat /etc/yumi/make_opts)"
        make $(cat /etc/yumi/make_opts) ${@}
    fi
}

if [ -f /etc/yumi/ninja_jobs ]; then
    export NINJAJOBS=$(cat /etc/yumi/ninja_jobs | xargs)
    echo "** CONFIGURING NINJA WITH NINJAJOBS=${NINJAJOBS}"
fi

# load the builder
. ${@}

# cleanning up
cleanup