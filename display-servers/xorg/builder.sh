echo "[I] Configuring system wide XORG_PREFIX and XORG_CONFIG..."

export XORG_PREFIX=/usr

export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
    --localstatedir=/var --disable-static"

if [[ ! -f /etc/profile.d/xorg.sh ]]; then
mkdir -pv /etc/profile.d && touch /etc/profile.d/xorg.sh
cat > /etc/profile.d/xorg.sh << EOF
XORG_PREFIX="$XORG_PREFIX"
XORG_CONFIG="$XORG_CONFIG"
export XORG_PREFIX XORG_CONFIG
EOF
fi

if [[ ! -f /etc/sudoers.d/xorg && -d /etc/sudoers.d ]]; then
echo "  * Adding configuration to keep xorg envvars in the sudo environment"
cat > /etc/sudoers.d/xorg << EOF
Defaults env_keep += XORG_PREFIX
Defaults env_keep += XORG_CONFIG
EOF
fi

cat << EOF
  * Add into your .bashrc this to load the xorg variables:
  * [ -f /etc/profile.d/xorg.sh ] && . /etc/profile.d/xorg.sh
EOF

declare -a packages=(
    util-macros
    xorgproto
    libXau
    libXdmcp
    xcb-proto
    libxcb
    xorg-libraries
)

load() {
    # . /var/yumi/display-servers/xorg/pkgs/${@}.sh || exit 1
    . /var/yumi/display-servers/xorg/pkgs/${@}.sh || read
}

add_source() {
    wget ${1}
    into_tar_source ${2}
}

for pkg in ${packages[@]}; do
    echo "[I] Installing $pkg..."
    sleep 1
    load $pkg
done