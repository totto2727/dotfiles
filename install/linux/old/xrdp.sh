version=1.4.4

cd
curl -L -O https://c-nergy.be/downloads/xRDP/xrdp-installer-$version.zip
unzip xrdp-installer-$version.zip 
rm xrdp-installer-$version.zip 

chmod +x  ~/xrdp-installer-$version.sh

./xrdp-installer-$version.sh
