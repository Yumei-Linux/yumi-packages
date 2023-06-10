test -d /usr/local/go && rm -rf /usr/go
tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
for i in go gofmt; do
    ln -svf /usr/local/go/bin/$i /usr/bin/$i
done