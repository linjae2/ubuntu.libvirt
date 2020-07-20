-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev, python-libvirt
Architecture: any all
Version: 0.9.7-2ubuntu9
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Dm-Upload-Allowed: yes
Homepage: http://libvirt.org
Standards-Version: 3.9.2
Build-Depends: cdbs (>= 0.4.90~), debhelper (>= 7), libxml2-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgnutls-dev, python-all-dev (>= 2.6.6-3~), libavahi-client-dev, libsasl2-dev, libxen-dev [i386 amd64], lvm2 [linux-any], open-iscsi-utils, libparted0-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libhal-dev [!linux-any], libpciaccess-dev, module-init-tools, policykit-1, libcap-ng-dev [linux-any], libnl-3-dev, libyajl-dev, libpcap0.8-dev, radvd, libxml2-utils, libapparmor-dev, dnsmasq-base, openssh-client, netcat-openbsd
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List: 
 libvirt-bin deb admin optional
 libvirt-dev deb libdevel optional
 libvirt-doc deb doc optional
 libvirt0 deb libs optional
 libvirt0-dbg deb debug extra
 python-libvirt deb python optional
Checksums-Sha1: 
 2f08609267154ad5377b3dc3952eb1e77469b570 17853636 libvirt_0.9.7.orig.tar.gz
 96ad12ccb59ab1b101a11e85b026f4188148d822 77760 libvirt_0.9.7-2ubuntu9.debian.tar.gz
Checksums-Sha256: 
 29ff05bfe5177d6680c02c279ed2573dcfae993f2824bffa192a3a2cdd05af23 17853636 libvirt_0.9.7.orig.tar.gz
 07d60ed374626743af7b83b8fe1c97125a1cf5eb0ea37c0012e04468b2075055 77760 libvirt_0.9.7-2ubuntu9.debian.tar.gz
Files: 
 4308b3f4d23f5b0c5196260a9a22a38b 17853636 libvirt_0.9.7.orig.tar.gz
 893e2bf882f0eaf3e5d58a3d90b12d55 77760 libvirt_0.9.7-2ubuntu9.debian.tar.gz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-libvirt/libvirt.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-libvirt/libvirt.git
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJPBNNYAAoJEOn+6gaoXj+dggkIALSnStNr0+FVCsxdLikX2MAC
CnlE69/6CW5sUZVkH4xktnm53sMgeM6Ykmb+bTnz5iOQttCVhCfU8DMGVS4bzp7y
RHsd3ZDCYu4NT4tq3/Vjr8V5ZdeSVbswQNGcgF5ZNQep7RTo7HV47cSvbVx2Doqt
Yh3r+yRyWTtfMMnZMNJoGtLAQo91GHy86vWWRkSZbgz6hMUAi3ip6EHoXbqXtfAa
9Klo6vSOZslxbylocPtuc4y+nRimefjWqoMkdbqueeNrDBSI7EfAGRyJmQJ/vw/G
aFMx8E53WlOZ9/jSu5yxA9pv8slRVr9RfByIdats7YBc18sOkKizQ3gj8PTYNMU=
=bGlq
-----END PGP SIGNATURE-----
