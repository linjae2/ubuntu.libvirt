-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: libvirt
Binary: libvirt-bin, libvirt0, libvirt0-dbg, libvirt-doc, libvirt-dev, python-libvirt
Architecture: any
Version: 0.8.3-3
Maintainer: Debian Libvirt Maintainers <pkg-libvirt-maintainers@lists.alioth.debian.org>
Uploaders: Guido Günther <agx@sigxcpu.org>, Laurent Léonard <laurent@open-minds.org>
Dm-Upload-Allowed: yes
Homepage: http://libvirt.org
Standards-Version: 3.9.1
Vcs-Browser: http://git.debian.org/?p=pkg-libvirt/libvirt.git
Vcs-Git: git://git.debian.org/git/pkg-libvirt/libvirt.git
Build-Depends: cdbs (>= 0.4.43), debhelper (>= 7), libxml2-dev, libncurses5-dev, libreadline-dev, zlib1g-dev, libgnutls-dev, python-dev (>= 2.3.5-11), python-central (>= 0.5.6), libavahi-client-dev, libsasl2-dev, libxen-dev [i386 amd64], lvm2, qemu [amd64 i386 powerpc sparc], open-iscsi, libparted0-dev (>= 2.2), libdevmapper-dev, uuid-dev, libudev-dev, libpciaccess-dev, module-init-tools, policykit-1, dpkg-dev (<< 1.15.3) | dpkg-dev (>> 1.15.3), libcap-ng-dev, virtualbox-ose [amd64 i386], libnl-dev
Build-Conflicts: dpkg-dev (= 1.15.3)
Checksums-Sha1: 
 4dc92139031f2af3141c2b1d0813b57ecd735c5d 12430752 libvirt_0.8.3.orig.tar.gz
 3598c5040d7ae01b483dd866b9e7456be2429046 25248 libvirt_0.8.3-3.debian.tar.gz
Checksums-Sha256: 
 35e1836c3947ac3edd7b4a1948cf13f5f13dd3e5bb31933d627d771b1e997a1f 12430752 libvirt_0.8.3.orig.tar.gz
 b8fc2574c83cb005a5203ec50b104da27e688a02b865dd285b1212b4a4027746 25248 libvirt_0.8.3-3.debian.tar.gz
Files: 
 ae8535ce119d32a2e9fb1f46e2c8f325 12430752 libvirt_0.8.3.orig.tar.gz
 6ad69ef88929dae86b07721df048fb4f 25248 libvirt_0.8.3-3.debian.tar.gz
Python-Version: current

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iD8DBQFMrLn1n88szT8+ZCYRAhrrAJwPqoymHgRk25S0WGtJ13UYB8QQ6wCcDkoi
gIzQ4MEVW5kYqozpCNpjssU=
=GqGV
-----END PGP SIGNATURE-----