TEMP=$(mktemp -p)

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
