into_tar_source Linux-PAM-1.5.3

./configure --prefix=/usr \
    --sbindir=/usr/sbin \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --enable-securedir=/usr/lib/security \
    --docdir=/usr/share/doc/Linux-PAM-1.5.3

_make && _make install
chmod -v 4755 /usr/sbin/unix_chkpwd

echo "[I] Configuring Linux-PAM with default config files..."
echo "  * Note that configuration files for pam at created at /etc/pam.d/*"
echo "  * feel free to inspect them and change as your liking."

install -vdm755 /etc/pam.d

cat > /etc/pam.d/system-account << "EOF" &&
# Begin /etc/pam.d/system-account

account   required    pam_unix.so

# End /etc/pam.d/system-account
EOF

cat > /etc/pam.d/system-auth << "EOF" &&
# Begin /etc/pam.d/system-auth

auth      required    pam_unix.so

# End /etc/pam.d/system-auth
EOF

cat > /etc/pam.d/system-session << "EOF" &&
# Begin /etc/pam.d/system-session

session   required    pam_unix.so

# End /etc/pam.d/system-session
EOF

cat > /etc/pam.d/system-password << "EOF"
# Begin /etc/pam.d/system-password

# use sha512 hash for encryption, use shadow, and try to use any previously
# defined authentication token (chosen password) set by any prior module.
# Use the same number of rounds as shadow.
password  required    pam_unix.so       sha512 shadow try_first_pass \
                                        rounds=500000

# End /etc/pam.d/system-password
EOF

cat > /etc/pam.d/other << "EOF"
# Begin /etc/pam.d/other

auth            required        pam_unix.so     nullok
account         required        pam_unix.so
session         required        pam_unix.so
password        required        pam_unix.so     nullok

# End /etc/pam.d/other
EOF