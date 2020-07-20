-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev, python-libvirt, libvirt-sanlock
Architecture: any all
Version: 0.10.2-1
Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Dm-Upload-Allowed: yes
Homepage: http://libvirt.org
Standards-Version: 3.9.3
Vcs-Browser: http://git.debian.org/?p=pkg-libvirt/libvirt.git
Vcs-Git: git://git.debian.org/git/pkg-libvirt/libvirt.git
Build-Depends: cdbs (>= 0.4.90~), debhelper (>= 7), libxml2-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgcrypt11-dev, libgnutls-dev, python-all-dev (>= 2.6.6-3~), libavahi-client-dev, libsasl2-dev, libxen-dev [i386 amd64], lvm2 [linux-any], open-iscsi [linux-any], libparted0-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libhal-dev [!linux-any], libpciaccess-dev, module-init-tools [linux-any], policykit-1, libcap-ng-dev [linux-any], libnl-dev [linux-any], libyajl-dev, libpcap0.8-dev, libnuma-dev [amd64 i386 ia64 mips mipsel powerpc], radvd [linux-any], libnetcf-dev [linux-any], libsanlock-dev [linux-any], libaudit-dev [linux-any], sheepdog, dwarves, libxml2-utils, dnsmasq-base, openssh-client, netcat-openbsd
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List: 
 libvirt-bin deb admin optional
 libvirt-dev deb libdevel optional
 libvirt-doc deb doc optional
 libvirt-sanlock deb libs extra
 libvirt0 deb libs optional
 libvirt0-dbg deb debug extra
 python-libvirt deb python optional
Checksums-Sha1: 
 1579fbd4272ede4a897143da666fe76b290b7767 21916817 libvirt_0.10.2.orig.tar.gz
 980b5355582cc5d8787664e019107f334d7e6d99 35327 libvirt_0.10.2-1.debian.tar.gz
Checksums-Sha256: 
 1fe69ae1268a097cc0cf83563883b51780d528c6493efe3e7d94c4160cc46977 21916817 libvirt_0.10.2.orig.tar.gz
 1334d5d7a5429435afabf2f59fecde03e34596c957a4f0dbfb0102cac8f3de19 35327 libvirt_0.10.2-1.debian.tar.gz
Files: 
 a5e50860d9da238ba270b528411c4a0d 21916817 libvirt_0.10.2.orig.tar.gz
 7e840434731ae04f343b6c964fd11a98 35327 libvirt_0.10.2-1.debian.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iD8DBQFQZGeKn88szT8+ZCYRAl8rAJ96BEdSAIZjkyPBEuSZ/bdw0UxBfgCdEWkO
EoBWOkPKQvwClPedU0l/HTI=
=bRO9
-----END PGP SIGNATURE-----
