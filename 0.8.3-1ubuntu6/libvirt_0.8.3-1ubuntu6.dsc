-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev, python-libvirt
Architecture: any
Version: 0.8.3-1ubuntu6
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Dm-Upload-Allowed: yes
Homepage: http://libvirt.org
Standards-Version: 3.9.1
Build-Depends: cdbs (>= 0.4.43), debhelper (>= 7), libxml2-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgnutls-dev, python-dev (>= 2.3.5-11), python-central (>= 0.5.6), libavahi-client-dev, libsasl2-dev, libxen3-dev [i386 amd64], lvm2, qemu-kvm [amd64 i386 powerpc sparc], open-iscsi-utils, libparted0-dev (>= 2.2), libdevmapper-dev, uuid-dev, libudev-dev, libpciaccess-dev, module-init-tools, policykit-1, dpkg-dev (<< 1.15.3) | dpkg-dev (>> 1.15.3), libcap-ng-dev, libnl-dev, libxml2-utils, libapparmor-dev
Build-Conflicts: dpkg-dev (= 1.15.3)
Checksums-Sha1: 
 4dc92139031f2af3141c2b1d0813b57ecd735c5d 12430752 libvirt_0.8.3.orig.tar.gz
 1b6e02bf85c90dad99e43d94b5a5a91a717f0dd7 58839 libvirt_0.8.3-1ubuntu6.debian.tar.gz
Checksums-Sha256: 
 35e1836c3947ac3edd7b4a1948cf13f5f13dd3e5bb31933d627d771b1e997a1f 12430752 libvirt_0.8.3.orig.tar.gz
 453d299cc4e1aee02fae08496ad724417113b67d63c82e0bd25e325094edc666 58839 libvirt_0.8.3-1ubuntu6.debian.tar.gz
Files: 
 ae8535ce119d32a2e9fb1f46e2c8f325 12430752 libvirt_0.8.3.orig.tar.gz
 36025de2b285c724b314d3db5aa381f3 58839 libvirt_0.8.3-1ubuntu6.debian.tar.gz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-libvirt/libvirt.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-libvirt/libvirt.git
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>
Python-Version: current

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkxyhEMACgkQonjfXui9pOPAYwCgmgzt+QhY5JgJLixBfTGXlJn0
3VgAoI2XGyaZJ84qfbtK2owhUcejxIil
=2OzO
-----END PGP SIGNATURE-----