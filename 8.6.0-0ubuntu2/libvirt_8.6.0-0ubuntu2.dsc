-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-clients, libvirt-login-shell, libvirt-daemon, libvirt-daemon-driver-qemu, libvirt-daemon-driver-lxc, libvirt-daemon-driver-vbox, libvirt-daemon-driver-xen, libvirt-daemon-driver-storage-gluster, libvirt-daemon-driver-storage-iscsi-direct, libvirt-daemon-driver-storage-rbd, libvirt-daemon-driver-storage-zfs, libvirt-daemon-system, libvirt-daemon-system-systemd, libvirt-daemon-system-sysv, libvirt-daemon-config-network, libvirt-daemon-config-nwfilter, libvirt0, libvirt-doc, libvirt-dev, libvirt-sanlock, libnss-libvirt, libvirt-wireshark
Architecture: any all
Version: 8.6.0-0ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders:  Guido Günther <agx@sigxcpu.org>, Andrea Bolognani <eof@kiyuko.org>,
Homepage: https://libvirt.org/
Standards-Version: 4.6.1
Vcs-Browser: https://salsa.debian.org/libvirt-team/libvirt
Vcs-Git: https://salsa.debian.org/libvirt-team/libvirt.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, libxml2-utils, linux-generic, linux-image-amd64, pkg-config, qemu-kvm, qemu-system
Build-Depends: augeas-tools, bash-completion, debhelper-compat (= 13), dh-apparmor [linux-any], iptables [linux-any], kmod [linux-any], libacl1-dev [linux-any], libapparmor-dev [linux-any], libattr1-dev [linux-any], libaudit-dev [linux-any], libblkid-dev, libc6-dev (>= 2.31-14~), libcap-ng-dev [linux-any], libcurl4-gnutls-dev, libdevmapper-dev [linux-any], libfuse3-dev [linux-any], libglib2.0-dev, libglusterfs-dev [linux-any], libgnutls28-dev, libiscsi-dev [linux-any], libnl-3-dev [linux-any], libnl-route-3-dev [linux-any], libnuma-dev [linux-any], libparted-dev, libpcap0.8-dev, libpciaccess-dev, librados-dev [linux-any], librbd-dev [linux-any], libreadline-dev, libsanlock-dev [linux-any], libsasl2-dev, libselinux1-dev [linux-any], libssh-dev, libtasn1-6-dev, libtirpc-dev, libudev-dev [linux-any], libwireshark-dev, libxen-dev [amd64 arm64 armhf], libxml2-dev, libxml2-utils, libyajl-dev, libzfslinux-dev [linux-amd64 linux-arm64 linux-armhf linux-i386 linux-ppc64el linux-s390x], lvm2 [linux-any], meson (>= 0.54.0~), nfs-common:native, numad:native [linux-any], open-iscsi [linux-any], po-debconf, python3-docutils, python3:native, qemu-system-common:native, qemu-utils, systemtap-sdt-dev [linux-any], xsltproc
Package-List:
 libnss-libvirt deb admin optional arch=linux-any
 libvirt-clients deb admin optional arch=any
 libvirt-daemon deb admin optional arch=any
 libvirt-daemon-config-network deb admin optional arch=all
 libvirt-daemon-config-nwfilter deb admin optional arch=all
 libvirt-daemon-driver-lxc deb admin optional arch=alpha,amd64,arm64,armel,armhf,hppa,i386,m68k,mips64el,mipsel,powerpc,ppc64,ppc64el,riscv64,s390x,sh4,sparc64,x32
 libvirt-daemon-driver-qemu deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-gluster deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-iscsi-direct deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-rbd deb admin optional arch=linux-any
 libvirt-daemon-driver-storage-zfs deb admin optional arch=linux-any
 libvirt-daemon-driver-vbox deb admin optional arch=amd64,i386
 libvirt-daemon-driver-xen deb admin optional arch=amd64,arm64,armhf
 libvirt-daemon-system deb admin optional arch=any
 libvirt-daemon-system-systemd deb admin optional arch=all
 libvirt-daemon-system-sysv deb admin optional arch=all
 libvirt-dev deb libdevel optional arch=any
 libvirt-doc deb doc optional arch=all
 libvirt-login-shell deb admin optional arch=alpha,amd64,arm64,armel,armhf,hppa,i386,m68k,mips64el,mipsel,powerpc,ppc64,ppc64el,riscv64,s390x,sh4,sparc64,x32
 libvirt-sanlock deb admin optional arch=linux-any
 libvirt-wireshark deb admin optional arch=any
 libvirt0 deb libs optional arch=any
Checksums-Sha1:
 f35af21342767716bbc4223627fddddf95a17cae 8905732 libvirt_8.6.0.orig.tar.xz
 70880609baf267a5ef18bad492049359241a465b 145316 libvirt_8.6.0-0ubuntu2.debian.tar.xz
Checksums-Sha256:
 a81847c43ac9ade61b6f8447c44e8ba2cc544ab49bac5c0b18a5b105f5da3ae2 8905732 libvirt_8.6.0.orig.tar.xz
 c249d01921321e9b4e0fa2e19c5e6bdf7b52e0d32b1bfc60bc8e7a48ebd9cd93 145316 libvirt_8.6.0-0ubuntu2.debian.tar.xz
Files:
 7928a133b9a95f2d74d4be6935efb38c 8905732 libvirt_8.6.0.orig.tar.xz
 eb2906c4966247f5f436ec328328269f 145316 libvirt_8.6.0-0ubuntu2.debian.tar.xz
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmM0QGoACgkQuj4pM4KA
skIw4xAAgl4E02QhodMPBfopd5YkGaqjHPWajtQCdQYJ7QeXXhKPDDTKCMnJK+As
/EaZQATehICk4MacZ3RXMo1WZB8AHkwEt5OqIO1TV0UJvgX12DIDSVuoDDBRua6G
pPrzNAwJeEYsCI7E2vuLJ4m5fPb7qM4z18Y8OUPQOgP3F1zt1ORIBKzZuR0+6QuV
lR3ury6DOnwTcDK1g/fJitDiWR7UW/SnRKoEEXPH0/ILJl1S8/oW1f3q3wPOID6h
Vjsz0iGyfXJBZKBfyAVLBFDkRPdauaiYrQ5T+FMD/9le2f+GNQEb+JAh+Kia2EKI
gr/I8ZUqwlZ8U/9PTczSNA6zipLTs4QHXR2KgrAM6c7cgFH4C80/uT6iJTjzFwFW
/b4YCm+1s2bBNJ33XIeP244MHZmpnKAwfkv8LD9Smzuq5Cjd+hIkByFtAdo1+NGx
BKNF4ecwC9siI3PWQ+5QEwwGEyIqalILgCe8exN1LgkSAHDWrM2E0MdS7dgyalYE
n1r724/1MQbrAruZrIVdCHeNbAyqqICuZ/T5SNdyMbmUsPVp9DPzfgoPjMkqlNjj
xWPVBX4N/8xml258ItY1Ar9TLEAvGvX1XFWBruWMaa0/mdlQjPJGoNk6ALsviANN
A0OIRNjYcrAYr/mDpR+Z24bCCUeXl+rs4an6Vcb2TNhzVjc3dtE=
=j/gA
-----END PGP SIGNATURE-----