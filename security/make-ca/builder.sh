into_tar_source make-ca-1.12

_make install
install -vdm755 /etc/ssl/local

/usr/sbin/make-ca -g

echo "[I] Enabling the update-pki.timer service using"
echo "  * $ systemctl enable update-pki.timer"
echo "  * Note: This daemon periodically updates the store via a systemd timer."

systemctl enable update-pki.timer

echo "[I] Adding additional CA certificates"
wget http://www.cacert.org/certs/root.crt &&
wget http://www.cacert.org/certs/class3.crt &&
openssl x509 -in root.crt -text -fingerprint -setalias "CAcert Class 1 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_1_root.pem &&
openssl x509 -in class3.crt -text -fingerprint -setalias "CAcert Class 3 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_3_root.pem &&
/usr/sbin/make-ca -r