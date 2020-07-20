-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev
Architecture: any all
Version: 1.2.1-0ubuntu5
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Homepage: http://libvirt.org
Standards-Version: 3.9.4
Build-Depends: cdbs (>= 0.4.90~), debhelper (>= 7), dh-autoreconf, libxml2-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgnutls-dev, libgcrypt11-dev, libavahi-client-dev, libsasl2-dev, libxen-dev [i386 amd64], lvm2 [linux-any], open-iscsi-utils, libparted0-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libhal-dev [!linux-any], libpciaccess-dev, module-init-tools [linux-any], policykit-1 (>= 0.105-3ubuntu3), libpolkit-gobject-1-dev (>= 0.105-3ubuntu3), libcap-ng-dev [linux-any], libnl-3-dev, libnl-route-3-dev, libyajl-dev, libpcap0.8-dev, libnuma-dev [amd64 i386 ia64 mips mipsel powerpc ppc64el], radvd [linux-any], libnetcf-dev [linux-any], libaudit-dev [linux-any], nfs-common, dwarves, libxml2-utils, libapparmor-dev, dnsmasq-base, openssh-client, netcat-openbsd, librbd-dev
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List: 
 libvirt-bin deb admin optional
 libvirt-dev deb libdevel optional
 libvirt-doc deb doc optional
 libvirt0 deb libs optional
 libvirt0-dbg deb debug extra
Checksums-Sha1: 
 ea8e237e0df9f1828ff4a7a649c42aa45af7ecd7 27228694 libvirt_1.2.1.orig.tar.gz
 af1f28e4b3dbfeea552119d2efb2fc4e32c835ac 106057 libvirt_1.2.1-0ubuntu5.debian.tar.gz
Checksums-Sha256: 
 bc29b5751bf36753c17e2fdbb75e70c7b07df3d9527586d3426e90f5f4abb898 27228694 libvirt_1.2.1.orig.tar.gz
 c988996e3f95f22a4fb54e0f0c1b1817f9213bddb69de400f38a7511da56d60d 106057 libvirt_1.2.1-0ubuntu5.debian.tar.gz
Files: 
 cce374220f67895afb6331bd2ddedbfd 27228694 libvirt_1.2.1.orig.tar.gz
 7cd15d28dbb5db96927cc9b9e1240baf 106057 libvirt_1.2.1-0ubuntu5.debian.tar.gz
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQEcBAEBAgAGBQJS6jBFAAoJEOn+6gaoXj+dlwUH/0+J3tnrW7l0m78zDhVwomil
wVCZoNMjBmh6YNhLlZn5oFgSAQwBPh5pef0s5TWN6DELiRJwlVnPcGrQEf20B2gW
mXQhCYsMGiZPm8DdVRqNmEfK4X2XD+KYxDX9U5sV8Id8fy415peLJFPSQEZ81i92
YUgTWkYW2f3PJodcXGoW/ifCT1Ci1MNme0F0w2OstxPwLa8oLG7iOHSDD+DZu++/
0ycpX6Eum+0EyVBs4AdSUvwcZlCVeb5O2Dislbwt8GJRBXJrBadLvD1Pk+WGT9Ro
kl4lYibePeE4G8CIaLddTJAebVZPA9zZ7sQdzpBttUyEn+j6mqh76Ypp4sBYczQ=
=VziM
-----END PGP SIGNATURE-----
