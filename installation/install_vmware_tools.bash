if [ ! -d "/mnt/cdrom" ]; then 
  mkdir /mnt/cdrom 
fi

#Using vmware console, vm/guest/install vmware tools

mount /dev/cdrom /mnt/cdrom
cp –p /mnt/cdrom/VMwareTools-4.0.0-261974.i386.rpm /tmp/
umount /mnt/cdrom
yum -y install gcc kernel-devel make
rpm -Uvh /tmp/VMwareTools-4.0.0-261974.i386.rpm
#The final step is this
vmware-config-tools.pl --default --compile
rm /tmp/VMwareTools-4.0.0-261974.i386.rpm 
