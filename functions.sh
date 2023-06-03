into_tar_source () {
    tar -xvf ${@}.tar*
    cd $@
}

cleanup () {
    cd ../
    rm -rvf ./${@}*
}

# load the builder
. ${@}