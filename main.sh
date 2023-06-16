# Clone Upstream
git clone https://github.com/medusalix/xone
cp -rvf ./debian ./xone
cd ./xone

# Get build deps
apt-get install dh-make -y
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p xone_0.3.git
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
