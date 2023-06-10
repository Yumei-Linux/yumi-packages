export RUSTUP_HOME=/opt/rust
export CARGO_HOME=/opt/rust

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

packages=(
    cargo
    cargo-clippy
    cargo-fmt
    cargo-miri
    clippy-driver
    rls
    rust-analyzer
    rust-gdb
    rust-gdbgui
    rust-lldb
    rustc
    rustdoc
    rustfmt
    rustup
)

echo "[I] Installing packages..."

for i in ${packages[@]}; do
echo "  * Installing /usr/bin/$i"
cat > /usr/bin/$i << "EOF"
#!/bin/sh
RUSTUP_HOME=/opt/rust exec /opt/rust/bin/${0##*/} "$@"
EOF
chmod +x /usr/bin/$i
done