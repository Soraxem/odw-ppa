#!/bin/bash
# Put your packages and sources *.deb, *.orig.tar.gz, *.dsc, *.changes to odw-os/pool/main
#This should be on the root of Apache or Nginx

mkdir -p odw-os/dists/trusty/main/{binary-all,binary-i386,binary-amd64,source}
mkdir -p odw-os/pool/main
mkdir -p cache
apt-ftparchive generate apt-ftparchive.conf
apt-ftparchive -c trusty.conf release odw-os/dists/trusty > odw-os/dists/trusty/Release
gpg --output odw-os/dists/trusty/Release.gpg -ba odw-os/dists/trusty/Release
