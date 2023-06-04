into_tar_source dash-0.5.12

./configure --bindir=/bin \
    --mandir=/usr/share/man

make && make install

if [[ "$(cat /etc/shells | grep '/bin/dash' | wc -l)" == 0 ]]; then
cat >> /etc/shells << "EOF"
/bin/dash
EOF
fi

cleanup dash-0.5.12