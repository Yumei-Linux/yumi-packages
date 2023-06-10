into_tar_source p11-kit-0.24.1

sed '20,$ d' -i trust/trust-extract-compat &&
cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

mkdir -pv p11-build && cd p11-build

meson setup --prefix=/usr \
    --buildtype=release \
    -Dtrust_paths=/etc/pki/anchors \
    ..

ninja && ninja install

ln -sfv /usr/libexec/p11-kit/trust-extract-compat \
    /usr/bin/update-ca-certificates