into_tar_source sudo-1.9.13p3

./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-secure-path \
    --with-all-insults \
    --with-env-editor \
    --docdir=/usr/share/doc/sudo-1.9.13p3 \
    --with-passprompt="[sudo] password for %p: "

_make && _make install

ln -svf libsudo_util.so.0.0.0 /usr/lib/sudo/libsudo_util.so.0

echo "[I] Configuring pam's sudo integration..."

cat > /etc/pam.d/sudo << "EOF"
# Begin /etc/pam.d/sudo

# include the default auth settings
auth      include     system-auth

# include the default account settings
account   include     system-account

# Set default environment variables for the service user
session   required    pam_env.so

# include system session defaults
session   include     system-session

# End /etc/pam.d/sudo
EOF

chmod 644 /etc/pam.d/sudo