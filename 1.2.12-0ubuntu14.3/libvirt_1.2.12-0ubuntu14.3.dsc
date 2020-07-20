-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev
Architecture: any all
Version: 1.2.12-0ubuntu14.3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Homepage: http://libvirt.org
Standards-Version: 3.9.6
Build-Depends: cdbs (>= 0.4.90~), debhelper (>= 7), dh-autoreconf, ebtables, libxml2-dev, libcurl4-gnutls-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgnutls-dev, libgcrypt11-dev, libavahi-client-dev, libsasl2-dev, libxen-dev [i386 amd64], lvm2 [linux-any], open-iscsi-utils, libxml-libxml-perl, libparted0-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libhal-dev [!linux-any], libpciaccess-dev, module-init-tools [linux-any], policykit-1 (>= 0.105-3ubuntu3), libpolkit-gobject-1-dev (>= 0.105-3ubuntu3), libcap-ng-dev [linux-any], libnl-3-dev, libnl-route-3-dev, libyajl-dev, libpcap0.8-dev, libnuma-dev [amd64 i386 ia64 mips mipsel powerpc ppc64el], radvd [linux-any], libnetcf-dev [linux-any], libaudit-dev [linux-any], nfs-common, dwarves, libxml2-utils, libapparmor-dev, dnsmasq-base, openssh-client, netcat-openbsd, librbd-dev, iptables, qemu-utils, libcgmanager-dev, xsltproc
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List:
 libvirt-bin deb admin optional arch=any
 libvirt-dev deb libdevel optional arch=any
 libvirt-doc deb doc optional arch=all
 libvirt0 deb libs optional arch=any
 libvirt0-dbg deb debug extra arch=any
Checksums-Sha1:
 1ccbc1d2cdb88cc5f317e95218429d42cb0ff235 30710487 libvirt_1.2.12.orig.tar.gz
 4e03a58db3e0ecf575bcf77c3c38c557921c1cb3 92788 libvirt_1.2.12-0ubuntu14.3.debian.tar.xz
Checksums-Sha256:
 eff5227f774560d97f0b44402a444e821c51e8cd44add89f74bc3c1f4dede66a 30710487 libvirt_1.2.12.orig.tar.gz
 6dac6401002c8735236076af15940225fb0806d87f83d2a3980d75406639fc18 92788 libvirt_1.2.12-0ubuntu14.3.debian.tar.xz
Files:
 2ae99535265ce4687d8718d744024c27 30710487 libvirt_1.2.12.orig.tar.gz
 1758a1ab678c3e442b6f0c3ba1c7b59b 92788 libvirt_1.2.12-0ubuntu14.3.debian.tar.xz
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCgAGBQJWOkONAAoJEOn+6gaoXj+dWSEIAJ8Bin4ljiwDQE8AvrKIITwS
eglZ+Jk4Tzc3OvRlbKfjcE/uaIReHg3OCL0Pm7tnyNMtYU4MQfHKo0/ekVeATYN0
Mniu1Drg3lHsR10iSZtbHTuJeu5PeTy1HBIF5HtkFmyNhPRDAdtllXXloywDEuK6
Vl7TKxa2pSbOVJ8K/4AQ5872i1hlLLQ9z+RTL7kSxgOJJgnB/esH8WHrxYl7PLnM
eIRlN5a+VjxS8BB9XTZnUeNkBUZiTLc86kK9pkhYJFXVUIaN1YMci8jNTGp6MXlC
RLDpH6d3m25DeeCXB4+waAzx5qbCq6kwuBbcdNIhOELIgoVFz1Hj9LbWkLbOaRQ=
=PCx0
-----END PGP SIGNATURE-----
