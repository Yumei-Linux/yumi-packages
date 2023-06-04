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
    rm -rvf $TEMP
}

# load the builder
. ${@}
