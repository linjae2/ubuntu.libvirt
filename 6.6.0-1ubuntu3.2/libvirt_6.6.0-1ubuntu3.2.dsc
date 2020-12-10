-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-clients, libvirt-daemon, libvirt-daemon-driver-qemu, libvirt-daemon-driver-lxc, libvirt-daemon-driver-vbox, libvirt-daemon-driver-xen, libvirt-daemon-driver-storage-gluster, libvirt-daemon-driver-storage-rbd, libvirt-daemon-driver-storage-zfs, libvirt-daemon-system, libvirt-daemon-system-systemd, libvirt-daemon-system-sysv, libvirt0, libvirt-doc, libvirt-dev, libvirt-sanlock, libnss-libvirt, libvirt-wireshark
Architecture: any all
Version: 6.6.0-1ubuntu3.2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders:  Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>,
Homepage: https://libvirt.org/
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/libvirt-team/libvirt
Vcs-Git: https://salsa.debian.org/libvirt-team/libvirt.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, libxml2-utils, linux-generic, linux-image-amd64, pkg-config, qemu-kvm, qemu-system
Build-Depends: augeas-tools, bash-completion, debhelper-compat (= 12), dh-apparmor [linux-any], dnsmasq-base, iptables (>= 1.8.1) [linux-any], kmod [linux-any], libapparmor-dev [linux-any], libattr1-dev [linux-any], libaudit-dev [linux-any], libcap-ng-dev [linux-any], libcurl4-gnutls-dev, libdbus-1-dev [linux-any], libdevmapper-dev [linux-any], libfuse-dev [linux-any], libgcrypt20-dev, libglusterfs-dev [linux-any], libgnutls28-dev, libnl-3-dev [linux-any], libnl-route-3-dev [linux-any], libnuma-dev [linux-any], libparted-dev (>= 2.2), libpcap0.8-dev, libpciaccess-dev, libpolkit-gobject-1-dev [linux-any], librados-dev [linux-any], librbd-dev [linux-any], libreadline-dev, libsanlock-dev [linux-any], libsasl2-dev, libselinux1-dev (>= 2.0.82) [linux-any], libtirpc-dev, libudev-dev [linux-any], libwireshark-dev (>= 1.11.3), libwiretap-dev, libxen-dev (>= 4.3) [i386 amd64 armhf arm64], libxml2-dev (>= 2.9.2+really2.9.1+dfsg1-0.2), libxml2-utils, libyajl-dev, libzfslinux-dev [linux-amd64 linux-arm64 linux-armhf linux-i386 linux-ppc64el linux-s390x], lvm2 [linux-any], netcat-openbsd, nfs-common, numad [linux-any], open-iscsi [linux-any], openssh-client, parted (>= 2.2), po-debconf, policykit-1 (>= 0.105-4~) [linux-any], python3, python3-docutils, qemu-system-common, qemu-utils, radvd [linux-any], systemtap-sdt-dev [linux-any], uuid-dev, xsltproc, zfsutils [kfreebsd-amd64 kfreebsd-i386], zlib1g-dev
Build-Conflicts: dpkg-dev (= 1.15.3)
Package-List:
 libnss-libvirt deb libs optional arch=linux-any
 libvirt-clients deb admin optional arch=any
 libvirt-daemon deb admin optional arch=any
 libvirt-daemon-driver-lxc deb admin optional arch=linux-any
 libvirt-daemon-driver-qemu deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-gluster deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-rbd deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-zfs deb admin optional arch=linux-any
 libvirt-daemon-driver-vbox deb admin optional arch=amd64,i386
 libvirt-daemon-driver-xen deb admin optional arch=amd64,arm64,armhf,i386
 libvirt-daemon-system deb admin optional arch=any
 libvirt-daemon-system-systemd deb admin optional arch=any
 libvirt-daemon-system-sysv deb admin optional arch=any
 libvirt-dev deb libdevel optional arch=any
 libvirt-doc deb doc optional arch=all
 libvirt-sanlock deb libs optional arch=linux-any
 libvirt-wireshark deb libs optional arch=any
 libvirt0 deb libs optional arch=any
Checksums-Sha1:
 88e4d2a62197013e45c0450d38bc3754b2a076c3 9305836 libvirt_6.6.0.orig.tar.xz
 4b6385e08d26fbac0d5782bd180a2d774c859723 833 libvirt_6.6.0.orig.tar.xz.asc
 e8ea18befa373d6416b5869b3626a028c1cab744 152732 libvirt_6.6.0-1ubuntu3.2.debian.tar.xz
Checksums-Sha256:
 94e52ddd2d71b650e1a7eb5ab7e651f9607ecee207891216714020b8ff081ef9 9305836 libvirt_6.6.0.orig.tar.xz
 46919026c65b3518a84efac96f87a9c99e63e4b79c31c5a1547223604ad34caa 833 libvirt_6.6.0.orig.tar.xz.asc
 2a4eae395ea24091675a06f853239115edfe78d2db7c08c2f56e4658820dbb5b 152732 libvirt_6.6.0-1ubuntu3.2.debian.tar.xz
Files:
 a1f1d1580292f8932bcbacf5801cf223 9305836 libvirt_6.6.0.orig.tar.xz
 6a2a77e2857cdc44b2007669da6e75ae 833 libvirt_6.6.0.orig.tar.xz.asc
 c2916741100dde6dcb4ffc38df7a188e 152732 libvirt_6.6.0-1ubuntu3.2.debian.tar.xz
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl/Q+L0ACgkQuj4pM4KA
skKD0A/+LzekKC+9CWayjuwxJ3XDGYxwY6+9R0ct3XzKL0kNsCbpGXNbRImcIZ8u
+d/cY5Sa+3XB5pBTnh6Z5wC2wO7RRLwjWb+MfIIjKkS5xD1sXAqc7TPhg8S/vPuD
PubwmnvJeBjAwqhWXDQoxS9oYNGVaGHcVXrvHaiWIA8diDRQSh4RpjBNddhX2rUd
N9qHROoA9B+Jv6/h8mXNWnw+il/ugFVGwF1d1dMpiHYSEzPMgYV1xUD261w8CMIF
TxjiP7v0RG3Oqm1KfdbUJZ2SE7HNQdqWFQmKcYAzd+1NKBt4LxNJSd9BU7esU7AD
YjHyGZjVPXG1d15Gb7uEeeF90Y5KaCF8Grltf5aLi62gtphv+5I/JVQXZqw8M76F
vtnz7lGt+JnxcixOkg3VM4m09d0iQMmbNI9lITPxH3ag/ap2c/un3dwzJyGzt7Nf
vx1vPcIb+aC0iqUX8nEEehvZwyFA2zYt661qWb7Z1pAg/wEiOir5tiEIwjb5AIC6
m5BObBLY/pOPpiAThR38YCQx7/K/3qD5AO2wyJpQHeYKIOV62dZDJ4Rlo7SH5ydx
1amBZFRGgq0MYOVH+uj5skeediLdhHR4ydasHf80X7DLNom4rZ/XAMOrhpZm72YY
COhiDBD0KJKAm2nR4dDYXHicYrQzP6tKp9WccFaVm1HUAxHy7Xs=
=X19T
-----END PGP SIGNATURE-----
