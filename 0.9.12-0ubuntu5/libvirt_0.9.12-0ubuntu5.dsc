-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev, python-libvirt
Architecture: any all
Version: 0.9.12-0ubuntu5
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Dm-Upload-Allowed: yes
Homepage: http://libvirt.org
Standards-Version: 3.9.3
Build-Depends: cdbs (>= 0.4.90~), debhelper (>= 7), libxml2-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgnutls-dev, libgcrypt11-dev, python-all-dev (>= 2.6.6-3~), libavahi-client-dev, libsasl2-dev, libxen-dev [i386 amd64], lvm2 [linux-any], open-iscsi-utils, libparted0-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libhal-dev [!linux-any], libpciaccess-dev, module-init-tools [linux-any], policykit-1, libcap-ng-dev [linux-any], libnl-3-dev, libnl-route-3-dev, libyajl-dev, libpcap0.8-dev, libnuma-dev [amd64 i386 ia64 mips mipsel powerpc], radvd [linux-any], dwarves, libxml2-utils, libapparmor-dev, dnsmasq-base, openssh-client, netcat-openbsd
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List: 
 libvirt-bin deb admin optional
 libvirt-dev deb libdevel optional
 libvirt-doc deb doc optional
 libvirt0 deb libs optional
 libvirt0-dbg deb debug extra
 python-libvirt deb python optional
Checksums-Sha1: 
 3743dc4f3e58d5912a98f568c3e854d97d81f216 20054618 libvirt_0.9.12.orig.tar.gz
 24364c5866239274196ebcdfedf73c0fdd387397 77740 libvirt_0.9.12-0ubuntu5.debian.tar.gz
Checksums-Sha256: 
 298ffc7f2a6d6e78aae46f11a0980f4bc17fa2928f5de6cd9e8abaf5990336e7 20054618 libvirt_0.9.12.orig.tar.gz
 0ac863edea09daf54abce5516a5bef2c2b1b04bf63fd6620d09753ddf15d7568 77740 libvirt_0.9.12-0ubuntu5.debian.tar.gz
Files: 
 5e842bc55733ceba60c64767580ff3e4 20054618 libvirt_0.9.12.orig.tar.gz
 693a415ca3ef25bd39d009e2f0326fa8 77740 libvirt_0.9.12-0ubuntu5.debian.tar.gz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-libvirt/libvirt.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-libvirt/libvirt.git
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJP/XlQAAoJEOn+6gaoXj+dyB8H+gM3gketvtmG7h7QUif1eO9x
C8pwGeZ4/wALxdwBRVQVErwJTcG4TQL2a0bBD0fpekItsztlR3sv9OlOfs5L84nt
7C/QAvGzmUoA6CrM8gYBUeVXb/T71+CX4kEAC2kv8ttyOjScJsvGKpsmFl+JokWT
uVUGMsb0GR37jKY1X8c4+Q4eEo3+gdLC6ko0pzJfIJSJDRILRNMVLyoyYV8+jVdW
737nMDjNPiYxxRmx+OqQ2/CjVgb8V5tWB12luv5WZa0hn4RS8UUqt30KM6zpFHPQ
d9TBu8NqBohhSFyX6CpK276qWeXfyRlhFBVcRkpl0AAwKmGOMSEUYOdi+InJMCk=
=9uCT
-----END PGP SIGNATURE-----