#!/bin/bash
# Put your packages and sources *.deb, *.orig.tar.gz, *.dsc, *.changes to debian/pool/main
#This should be on the root of Apache or Nginx

mkdir -p debian/dists/{precise,trusty,stable,testing}/main/{binary-all,binary-i386,binary-amd64,source}
mkdir -p debian/pool/main
mkdir -p cache
apt-ftparchive generate apt-ftparchive.conf
apt-ftparchive -c precise.conf release debian/dists/precise > debian/dists/precise/Release
apt-ftparchive -c trusty.conf release debian/dists/trusty > debian/dists/trusty/Release
apt-ftparchive -c stable.conf release debian/dists/stable > debian/dists/stable/Release
apt-ftparchive -c testing.conf release debian/dists/testing > debian/dists/testing/Release
gpg --output debian/dists/trusty/Release.gpg -ba debian/dists/trusty/Release
gpg --output debian/dists/precise/Release.gpg -ba debian/dists/precise/Release
gpg --output debian/dists/stable/Release.gpg -ba debian/dists/stable/Release
gpg --output debian/dists/testing/Release.gpg -ba debian/dists/testing/Release
