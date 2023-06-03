TEMP=$(mktemp -p)

mv -v ${@}.tar* $TEMP

cd $TEMP

into_tar_source () {
    tar -xvf ${@}.tar*
    cd $@
}

cleanup () {
    cd /
    rm -rvf /tmp/$TEMP
}

# load the builder
. ${@}
