source libcap-2.67

sed -i '/install -m.*STA/d' libcap/Makefile

_make prefix=/usr lib=lib
_make prefix=/usr lib=lib install