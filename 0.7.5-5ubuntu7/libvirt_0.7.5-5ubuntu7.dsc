-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 1.0
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev, python-libvirt
Architecture: any
Version: 0.7.5-5ubuntu7
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Dm-Upload-Allowed: yes
Homepage: http://libvirt.org
Standards-Version: 3.8.3
Build-Depends: cdbs (>= 0.4.43), debhelper (>= 7), libxml2-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgnutls-dev, python-dev (>= 2.3.5-11), python-central (>= 0.5.6), quilt, libavahi-client-dev, libsasl2-dev, libxen3-dev [i386 amd64], lvm2, qemu-kvm [amd64 i386 powerpc sparc], open-iscsi-utils, libparted1.8-dev, libdevmapper-dev, uuid-dev, libudev-dev, libpciaccess-dev, module-init-tools, policykit-1, dpkg-dev (<< 1.15.3) | dpkg-dev (>> 1.15.3), libxml2-utils, libapparmor-dev, libcap-ng-dev
Build-Conflicts: dpkg-dev (= 1.15.3)
Checksums-Sha1: 
 8d88541d67a2da50adb85b447b5a01204afeaf7c 9343666 libvirt_0.7.5.orig.tar.gz
 61fbcb027e5bc4986f9cae893c5f2e1fb0319aa2 44807 libvirt_0.7.5-5ubuntu7.diff.gz
Checksums-Sha256: 
 922481aadf72a74cf14012fe3967c60d01e70f7e88908410d57428943ab4eb8b 9343666 libvirt_0.7.5.orig.tar.gz
 88b2338bda6e326c5f037c1833727804f71ba5584698b742ffab6679dc2ac464 44807 libvirt_0.7.5-5ubuntu7.diff.gz
Files: 
 06eedba78d4848cede7ab1a6e48f6df9 9343666 libvirt_0.7.5.orig.tar.gz
 2f41ccded7a55e8d0babaa217b4e9e87 44807 libvirt_0.7.5-5ubuntu7.diff.gz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-libvirt/libvirt.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-libvirt/libvirt.git
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>
Python-Version: current

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktvjsAACgkQLMAs/0C4zNq7nwCfZylNf2Tl/D806O10eBNlIl8j
1moAnRGua7mbCpqrmefGY6n/i49YS962
=F1ma
-----END PGP SIGNATURE-----