-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt-clients, libvirt-daemon, libvirt-daemon-system, libvirt0, libvirt-doc, libvirt-dev, libvirt-sanlock, libnss-libvirt
Architecture: any all
Version: 2.5.0-3ubuntu5.1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Homepage: http://libvirt.org
Standards-Version: 3.9.8
Vcs-Browser: https://git.launchpad.net/~libvirt-maintainers/ubuntu/+source/libvirt
Vcs-Git: git://git.launchpad.net/~libvirt-maintainers/ubuntu/+source/libvirt
Testsuite: autopkgtest
Build-Depends: debhelper (>= 8.9.7~), dh-autoreconf, dh-systemd (>= 1.18~), dh-apparmor [linux-any], libxml2-dev (>= 2.9.2+really2.9.1+dfsg1-0.2), libcurl4-gnutls-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgcrypt20-dev, libgnutls28-dev, libavahi-client-dev, libsasl2-dev, libxen-dev (>= 4.3) [i386 amd64 armhf arm64], lvm2 [linux-any], open-iscsi [linux-any], libparted0-dev (>= 2.2), parted (>= 2.2), libdevmapper-dev [linux-any], uuid-dev, libudev-dev [linux-any], libpciaccess-dev, kmod [linux-any], policykit-1 (>= 0.105-4~), libpolkit-gobject-1-dev, libcap-ng-dev [linux-any], libnl-3-dev [linux-any], libnl-route-3-dev [linux-any], libyajl-dev, libpcap0.8-dev, libnuma-dev [amd64 arm64 i386 ia64 mips mipsel powerpc ppc64 ppc64el s390x], numad [amd64 arm64 i386 ia64 mips mipsel powerpc ppc64 ppc64el s390x], radvd [linux-any], libnetcf-dev (>= 1:0.2.3-3~) [linux-any], libsanlock-dev [linux-any], libaudit-dev [linux-any], libapparmor-dev [linux-any], libdbus-1-dev [linux-any], nfs-common, systemtap-sdt-dev [amd64 armel armhf i386 ia64 powerpc ppc64el s390 s390x], python, xsltproc, zfsutils [kfreebsd-amd64 kfreebsd-i386], po-debconf, librbd-dev [linux-any], librados-dev [linux-any], libfuse-dev [linux-any], qemu-system-common, augeas-tools, dwarves, libxml2-utils, dnsmasq-base, openssh-client, netcat-openbsd, ebtables [linux-any], iptables [linux-any], qemu-utils
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
 048853b984a6d4ffc2da3a9d001f0e8a3b4d90ff 13638636 libvirt_2.5.0.orig.tar.xz
 7e0d02a96e9d3a232e3c86c0a239ae5b9a995836 123832 libvirt_2.5.0-3ubuntu5.1.debian.tar.xz
Checksums-Sha256:
 819dffefbfd6ae95dfe1b28cfdee15ebcf9f91bbd732157488a57705bf81cb1e 13638636 libvirt_2.5.0.orig.tar.xz
 d2e77c6950b8f107f6c10d094f7919974a4343fd7c8f5fd3037485509a76df14 123832 libvirt_2.5.0-3ubuntu5.1.debian.tar.xz
Files:
 001af1ca2545971c6b46628678fd4afa 13638636 libvirt_2.5.0.orig.tar.xz
 477c06b5eea082382bd62b4a7b2b375a 123832 libvirt_2.5.0-3ubuntu5.1.debian.tar.xz
Debian-Vcs-Browser: https://anonscm.debian.org/cgit/pkg-libvirt/libvirt.git/
Debian-Vcs-Git: https://anonscm.debian.org/git/pkg-libvirt/libvirt.git
Original-Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEZPoAAoJELo+KTOCgLJCCbwQAK0VfPJ4W1L0EihJEKVAIbRP
xZ5OXYO9aBC+dC6hzrGX2FHuMm5N2mdUazes0zwVLnk7vC95usHGFPI1c6o+pORx
uB4y0LoFbqy/1r+hSv7ITe37wnDcPzlsxem909E8BWINieZY6zol/WwDZNj+FxYX
ocjrfFLoxPErEEroD9xCBuBBtSYE4U1C7+sFpSMAyfFwmcVxiY6JZpf1xCxRWhbp
8f7NH/VzY8LuLGBzZAjIBHHUMYIA3qBRqAB87qASriGEEF2DTPeMTWVxXvFTQpb2
qgl4cerpJzy8X1aWO82IrhW87ES7NFLs60+H1sWvGvARYNKvQjA7WRPc24t7yKA3
OJVKOtxqzX6a38qs5wUBphRv1LskPbVBiFlcw+8mj8bO+7qsibgtJQ6ubYQFsfYt
KaootRuwHzMCvrGB4zhK77Ft+gJPKxFBgmswHHcT/cVgZOHJ/kSc8dPj4GMg7ojU
q3tNJmSEnLcXb4A1X1mkq/PEoyVJqT8AD+XBkuEmmR4nhIVziAhD7TLgbsLUOywV
zVQ7Cf4Rsm3mfKkxCF9p7+L5r8Nf/iY37Oju8z4Qy1XZdTnzMmQhYlWFi1eqzTA+
5XpognCasHPFJlw8Vbxkr4eEd9q0y19KLqT/P63ox8p5hTkaoseecgJTagHmhKrO
8yH+wFsYyAFRBitm0rz7
=O1/N
-----END PGP SIGNATURE-----