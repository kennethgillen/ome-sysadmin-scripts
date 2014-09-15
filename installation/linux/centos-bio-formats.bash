#sysadmin tools
yum -y install screen tmux htop expect bonnie++ tree unzip

#ome local
yum -y install check-mk-agent
chkconfig xinetd on

#java
yum -y install java-1.7.0-openjdk
yum -y install java-1.7.0-openjdk-devel

#git
yum -y install git

#ant
wget http://mirror.catn.com/pub/apache/ant/binaries/apache-ant-1.9.2-bin.tar.gz
md5sum apache-ant-1.9.2-bin.tar.gz
wget http://www.apache.org/dist/ant/KEYS
gpg --import KEYS
gpg --verify apache-ant-1.9.2-bin.tar.gz.asc
tar zxvf apache-ant-1.9.2-bin.tar.gz -C /opt
ln -s /opt/apache-ant-1.9.2/ /opt/ant
ln -s /opt/ant/bin/ant /usr/bin/ant
echo ANT_HOME=/opt/ant >> /etc/profile.d/ant.sh # definitely works
ant -version # to test

#xelatex

