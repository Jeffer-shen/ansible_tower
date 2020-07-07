

tar -xf ansible-tower-setup-bundle-3.7.1-1.tar.gz
tar -xf local_tower_rpm.tar.gz


cd rpm_bundles
sh rpm_install.sh
cd ..


mkdir /etc/yum.repos.d/back
mv  /etc/yum.repos.d/*.repo /etc/yum.repos.d/back/
mv a.repo /etc/yum.repos.d/
yum repolist

cd ansible-tower-setup-bundle-3.7.1-1
sed -i '7d' inventory && sed -i "6a admin_password=\'admin\'" inventory
sed -i '14d' inventory && sed -i "13a pg_password=\'admin\'" inventory
sh setup.sh

