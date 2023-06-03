into_tar_source dash-0.5.12

./configure --bindir=/bin \
    --mandir=/usr/share/man

make && make install

cat >> /etc/shells << EOF
/bin/dash
EOF

cleanup dash-0.5.12