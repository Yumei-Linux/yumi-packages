source perl-5.36.0

sh Configure -des \
    -Dprefix=/usr \
    -Dvendorprefix=/usr \
    -Dprivlib=/usr/lib/perl5/perl5.36/core_perl \
    -Darchlib=/usr/lib/perl5/perl5.36/core_perl \
    -Dsitelib=/usr/lib/perl5/perl5.36/site_perl \
    -Dsitearch=/usr/lib/perl5/perl5.36/site_perl \
    -Dvendorlib=/usr/lib/perl5/perl5.36/vendor_perl \
    -Dvendorarch=/usr/lib/perl5/perl5.36/vendor_perl

_make && _make install