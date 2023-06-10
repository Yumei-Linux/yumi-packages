echo "[I] Configuring system wide XORG_PREFIX and XORG_CONFIG..."

export XORG_PREFIX=/usr

export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
    --localstatedir=/var --disable-static"

cat > /etc/profile.d/xorg.sh << EOF
XORG_PREFIX="$XORG_PREFIX"
XORG_CONFIG="$XORG_CONFIG"
export XORG_PREFIX XORG_CONFIG
EOF

cat > /etc/sudoers.d/xorg << EOF
Defaults env_keeep += XORG_PREFIX
Defaults env_keep += XORG_CONFIG
EOF

cat << EOF
  * Add into your .bashrc this to load the xorg variables:
  * [ -f /etc/profile.d/xorg.sh ] && . /etc/profile.d/xorg.sh
EOF

declare -a packages=(
    util-macros
)

load() {
    . /var/yumi/display-servers/xorg/pkgs/${@}.sh || exit 1
}

for pkg in ${packages[@]}; do
    echo "[I] Installing $pkg..."
    sleep 1
    load $pkg
done