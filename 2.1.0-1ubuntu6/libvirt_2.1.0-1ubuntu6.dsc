-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt-clients, libvirt-daemon, libvirt-daemon-system, libvirt0, libvirt-doc, libvirt-dev, libvirt-sanlock, libnss-libvirt
Architecture: any all
Version: 2.1.0-1ubuntu6
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Homepage: http://libvirt.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-libvirt/libvirt.git/
Vcs-Git: https://anonscm.debian.org/git/pkg-libvirt/libvirt.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, pkg-config
Build-Depends: debhelper (>= 8.9.7~), dh-autoreconf, dh-systemd (>= 1.18~), dh-apparmor [linux-any], libxml2-dev (>= 2.9.2+really2.9.1+dfsg1-0.2), libcurl4-gnutls-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgcrypt20-dev, libgnutls28-dev, libavahi-client-dev, libsasl2-dev, libxen-dev (>= 4.3) [i386 amd64 armhf arm64], lvm2 [linux-any], open-iscsi [linux-any], libxml-libxml-perl, libparted0-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libpciaccess-dev, kmod [linux-any], policykit-1 (>= 0.105-4~), libpolkit-gobject-1-dev, libcap-ng-dev [linux-any], libnl-3-dev [linux-any], libnl-route-3-dev [linux-any], libyajl-dev, libpcap0.8-dev, libnuma-dev [amd64 i386 ia64 mips mipsel powerpc ppc64 ppc64el s390x], radvd [linux-any], libnetcf-dev (>= 1:0.2.3-3~) [linux-any], libsanlock-dev [linux-any], libaudit-dev [linux-any], libapparmor-dev [linux-any], libdbus-1-dev [linux-any], nfs-common, systemtap-sdt-dev [amd64 armel armhf i386 ia64 powerpc ppc64el s390 s390x], xsltproc, librbd-dev [linux-any], librados-dev [linux-any], zfsutils-linux [amd64 arm64 ppc64el s390x], libfuse-dev [linux-any], qemu-system-common, augeas-tools, dwarves, libxml2-utils, dnsmasq-base, openssh-client, netcat-openbsd, ebtables [linux-any], iptables [linux-any], qemu-utils
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List:
 libnss-libvirt deb libs extra arch=linux-any
 libvirt-bin deb oldlibs extra arch=any
 libvirt-clients deb admin optional arch=any
 libvirt-daemon deb admin optional arch=any
 libvirt-daemon-system deb admin optional arch=any
 libvirt-dev deb libdevel optional arch=any
 libvirt-doc deb doc optional arch=all
 libvirt-sanlock deb libs extra arch=linux-any
 libvirt0 deb libs optional arch=any
Checksums-Sha1:
 3a0c3f224236efc629c495a278113846b4d78cbf 13212368 libvirt_2.1.0.orig.tar.xz
 0135c65e93ca73fd987238e5833d7b1ac53bed33 120756 libvirt_2.1.0-1ubuntu6.debian.tar.xz
Checksums-Sha256:
 1a799562337472ab00f76aa30a53d54c623c96633070ec53286c9cc2a456316b 13212368 libvirt_2.1.0.orig.tar.xz
 99ea3a6236f709445f749d03ed11fe013c7556e3e9a3c77bdf0a065df074f5fe 120756 libvirt_2.1.0-1ubuntu6.debian.tar.xz
Files:
 fd1c054a8b59235e877efb728de79386 13212368 libvirt_2.1.0.orig.tar.xz
 2d37e359f588af1214cefd89c50bfa5e 120756 libvirt_2.1.0-1ubuntu6.debian.tar.xz
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJX3TPDEBxkb2tvQHVidW50dS5jb20ACgkQvX6qYHePpvVbxxAA
tbqCiTWBjB8dnAFCfgO1MXhQgTEaDiFexZ5shFb0qN90tUpYirotOKQbksiz8Gzy
utm0JIt4GKihngOrof7B4tT9idL2g6031MJICXMO/2nq8K60ZK+pJFihdLc7r2eY
wCapL6+S0uEAlN6kN6yFZgiX1Er8u9bpUkoOr97Cyly7LJPvhSZXhH+V88g5FlUw
a7rmq07+bMA53l+Uy8fip7B8eDXJKQ69SwlqfXzzYpGFeCw0CQbnoqWfDwWbhT6R
Zh+vvIu+7a8Wiah5yOcE4lERUJdf3SbVUBQ5Wvax5XSEtaAcxcQSKp60C6gE9XWf
2gmqdLiXvatxe1ax7tNIT+HFTCtPGSNZojM4D4JH5uokEl5PWvgSafvpYyOsczwA
Tq4fFs1rdD2XKSvXDtTOY5px5rmnP3cLV0Lkn/lD0zZ4Ffuhp+XsttO8vPp2EKhz
H6gYmydQLGEgizRdcJo1pxPBWUhSjC480rllxD1VNqDk9GPzHqFciMmayo2/qnqZ
M20b8uiVsTFqlXfxBM0KCUfOPYj+/Gi/iQgJ2efUKf4dhylYuXEnaJZGxSGlf/WG
beLCg0YM+earUp2ofZthXU9ngToyoReQvzGOEi2beRhS5qK3zHsKvq8iRW/r8GPK
0EmNK0re8OmUUgR+7pg8VMs2ZM5fJRNYDEIMp+ImmtM=
=Oegm
-----END PGP SIGNATURE-----
