whydidyouremovesources () {
    echo "[Fatal] cannot find ca-certificates source files... did you remove /sources?"
    exit 1
}

CERTDATA=/sources/ca-certificates/certdata.txt
MAKECA=/sources/ca-certificates/make-ca.sh-20170514

if [ ! -f "$CERTDATA" ]; then
    whydidyouremovesources
fi

if [ ! -f "$MAKECA" ]; then
    whydidyouremovesources
fi

cp -rvf "$CERTDATA" "$PWD"
cp -rvf "$MAKECA" "$PWD"

pwd ; ls

cleanup