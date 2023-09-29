#! /bin/bash

# Clone Upstream
git clone https://github.com/medusalix/xone
cp -rvf ./debian ./xone
cd ./xone

for i in ../patches/* ; do patch -Np1 -i $i; done

# Get build deps
apt-get install dh-make -y
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
