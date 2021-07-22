-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-clients, libvirt-daemon, libvirt-daemon-driver-storage-gluster, libvirt-daemon-driver-storage-rbd, libvirt-daemon-driver-storage-zfs, libvirt-daemon-system, libvirt0, libvirt-doc, libvirt-dev, libvirt-sanlock, libnss-libvirt, libvirt-wireshark
Architecture: any all
Version: 5.0.0-1ubuntu3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Homepage: http://libvirt.org
Standards-Version: 4.1.1
Vcs-Browser: https://git.launchpad.net/~libvirt-maintainers/ubuntu/+source/libvirt
Vcs-Git: git://git.launchpad.net/~libvirt-maintainers/ubuntu/+source/libvirt
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, libxml2-utils, linux-generic, linux-image-amd64, pkg-config, qemu-kvm, qemu-system
Build-Depends: bash-completion, debhelper (>= 9.20160709~), dh-autoreconf, dh-apparmor [linux-any], libxml2-dev (>= 2.9.2+really2.9.1+dfsg1-0.2), libncurses5-dev, libreadline-dev, zlib1g-dev, libgcrypt20-dev, libgnutls28-dev, libavahi-client-dev, libsasl2-dev, libxen-dev (>= 4.3) [i386 amd64 armhf arm64], lvm2 [linux-any], open-iscsi [linux-any], libparted-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libpciaccess-dev, kmod [linux-any], policykit-1 (>= 0.105-4~), libcurl4-gnutls-dev, libpolkit-gobject-1-dev, libcap-ng-dev [linux-any], libnl-3-dev [linux-any], libnl-route-3-dev [linux-any], libyajl-dev, libpcap0.8-dev, libnuma-dev [amd64 arm64 i386 ia64 mips mipsel powerpc ppc64 ppc64el s390x], numad [amd64 arm64 i386 ia64 mips mipsel powerpc ppc64 ppc64el s390x], radvd [linux-any], libsanlock-dev [linux-any], libaudit-dev [linux-any], libselinux1-dev (>= 2.0.82) [linux-any], libapparmor-dev [linux-any], libdbus-1-dev [linux-any], nfs-common, systemtap-sdt-dev [amd64 armel armhf i386 ia64 powerpc ppc64el s390 s390x], python, xsltproc, zfsutils [kfreebsd-amd64 kfreebsd-i386], po-debconf, librbd-dev [linux-any], librados-dev [linux-any], glusterfs-common (>= 3.4.0), libwireshark-dev (>= 1.11.3), libwiretap-dev, libfuse-dev [linux-any], qemu-system-common, augeas-tools, libxml2-utils, dnsmasq-base, openssh-client, netcat-openbsd, ebtables [linux-any], iptables [linux-any], qemu-utils
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List:
 libnss-libvirt deb libs optional arch=linux-any
 libvirt-clients deb admin optional arch=any
 libvirt-daemon deb admin optional arch=any
 libvirt-daemon-driver-storage-gluster deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-rbd deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-zfs deb admin optional arch=linux-any
 libvirt-daemon-system deb admin optional arch=any
 libvirt-dev deb libdevel optional arch=any
 libvirt-doc deb doc optional arch=all
 libvirt-sanlock deb libs optional arch=linux-any
 libvirt-wireshark deb libs optional arch=any
 libvirt0 deb libs optional arch=any
Checksums-Sha1:
 2daa9f44c8631d11d798b1e2ee6df726df449173 14832576 libvirt_5.0.0.orig.tar.xz
 0f8e54fd159d01abca26d1282221d8de19b294a9 131852 libvirt_5.0.0-1ubuntu3.debian.tar.xz
Checksums-Sha256:
 afa81dbbc90b5209575930a820a222ff371e5ece5c1d8ec8f46b53c52b73b2e7 14832576 libvirt_5.0.0.orig.tar.xz
 c5568cb3fe8d8eef56546e30faef9af88d75f5fd5b58295c888153b3d886c373 131852 libvirt_5.0.0-1ubuntu3.debian.tar.xz
Files:
 b67b226b8f22fbe86991daec5d71ef82 14832576 libvirt_5.0.0.orig.tar.xz
 1047fe9236d57530f230ce5e60bce295 131852 libvirt_5.0.0-1ubuntu3.debian.tar.xz
Debian-Vcs-Browser: https://salsa.debian.org/libvirt-team/libvirt
Debian-Vcs-Git: https://salsa.debian.org/libvirt-team/libvirt.git
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUMSg3c8x5FLOsZtRZWnYVadEvpMFAlzcahIACgkQZWnYVadE
vpM1ahAAmMCZ4X35h1wspNWY/e9LpIJ11locYlC1f0GuBf71Bt9v/6Sw8EJKM2oR
13zumqA9IKOhy5hbTCPuumTlgsxG3rpkkuhLNKdy6rsdLg+MTjcOgA24DU9bJ3pc
mxvsePZhGzc3QF2Id+RVfSlk8Wz8jkO8TjEjOsyAhhBn66mSGWtmBLayYj3K9/oj
P1jHLJE6SxRFbiH0KPjJPSj2P5NoU+67tareV1FhZwHDoy6cCA35VzcQPNIqC3vZ
lX0NByvOwfFhjAwYTOVJTdSSFi2vr0vBO3QZkhSHPaA7OruXIv0sG75T48gfm31H
YtGZ7f6VRRgXGxqKdjLhd2ThdQo4bXYNVCYq/e99zz3v3SCaCLDY5E7YRCS9bt/A
jxcL8xGJfsocZ09X8ypmbzEQ7uvYFIhUPC67cs027/XA0KF8yk1q5+UXv9rMLpGl
0G6SdTPPf2vvLdylz6gVGaUxgKhe3pDhlkxygLm8RskJmCPYEZp/pzRt2k9EeqJz
b/YfkNobukDzF92kYtIzOyzoI3/sWZvPCtbYLjVKZCI3HQMCwuhnzVl9VhDqo1Vp
BZJj2gWIID81vN77+l54ICWuwooQUN6gxEjQKxfjADYlsMUn5Lw9FxgEciu8JiMg
R6VWIOOlTEapXOwAYYEF8ECtlu25otSOINJ+cMizCC07U9Zmiac=
=hbAM
-----END PGP SIGNATURE-----