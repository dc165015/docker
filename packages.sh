
cd

#apt-fast 通过使用多线程下载来给apt-get 提速
notify installing curl, wget, aria2
apt-get install -y curl wget aria2

notify installing apt-fast
/bin/bash -c "$(curl -sL https://git.io/vokNn)"

notify installing net-tools ssh cifs-utils apt-file apt-utils software-properties-common
# to use CIFS to share files, pls refer to https://wiki.ubuntu.com/MountWindowsSharesPermanently
apt-fast install -y net-tools ssh cifs-utils apt-file apt-utils software-properties-common
apt-file update

apt-fast install -y locales

#notify installing lantern and setup proxy to 0.0.0.0:8888
#wget -T 30 -t 2 -O - https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb | dpkg -i -
#lantern -headless -addr 0.0.0.0:8888 &
#export https_proxy="http:/127.0.0.1:8888"

notify installing chrome, firefox
wget -T 30 -t 2 -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list
apt-fast update
apt-fast install -y firefox google-chrome-stable

notify installing build-essential make git
apt-fast install -y build-essential make git #nginx mongodb mysql-server

notify installing jdk, gradle to setup meteor android env
apt-fast install -y default-jdk gradle

notify installing meteor
curl https://install.meteor.com/ | sh

notify upgrading packages
apt-fast upgrade -y

notify cleaning apt
apt-fast autoremove
apt-fast autoclean
