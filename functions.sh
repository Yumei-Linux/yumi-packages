TEMP=$(mktemp -p)

mv -v ./.yumi-downloads/* $TEMP
rmdir ./.yumi-downloads/

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
