source gettext-0.21.1

./configure --disable-shared
_make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin