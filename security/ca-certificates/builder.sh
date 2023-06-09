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

install -vdm755 /etc/ssl/local
openssl x509 -in root.crt -text -fingerprint -setalias "CAcert Class 1 root" \
    -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
    > /etc/ssl/local/CAcert_Class_1_root.pem

install -vm755 make-ca.sh-20170514 /usr/sbin/make-ca.sh

/usr/sbin/make-ca.sh

