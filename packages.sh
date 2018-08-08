
cd

#apt-fast 通过使用多线程下载来给apt-get 提速
notify installing curl, wget, aria2
sudo apt-get install -y curl wget aria2

notify installing apt-fast
sudo /bin/bash -c "$(curl -sL https://git.io/vokNn)"

notify installing net-tools ssh cifs-utils apt-file apt-utils software-properties-common
# to use CIFS to share files, pls refer to https://wiki.ubuntu.com/MountWindowsSharesPermanently
sudo apt-fast install -y net-tools ssh cifs-utils apt-file apt-utils software-properties-common
sudo apt-file update

sudo apt-fast install -y locales

notify installing chrome, firefox
wget -T 30 -t 2 -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/google.list
sudo apt-fast update
sudo apt-fast install -y firefox google-chrome-stable

notify installing build-essential make git
sudo apt-fast install -y build-essential make git #nginx mongodb mysql-server

notify installing nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | sudo bash

notify installing nodejs
curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -
sudo apt-fast install -y nodejs
sudo apt-fast install -y npm

notify installing cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm update

notify installing tslint eslint types jslint jquery typescript gulp mocha yarn webpack
cnpm i -g tslint eslint types jslint jquery typescript gulp gulp-cli mocha yarn webpack

notify installing eslint airbnb.react+meteor dependencies
(export PKG=eslint-config-airbnb-base; cnpm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs cnpm install -g --save-dev "$PKG@latest")
cnpm install -g babel-eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-meteor eslint-plugin-react eslint-plugin-jsx-a11y eslint-import-resolver-meteor eslint @meteorjs/eslint-config-meteor

notify installing VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt-fast update
sudo apt-fast install -y code

# install VS code manually
# add-apt-repository ppa:ubuntu-desktop/ubuntu-make
# apt-get update
# apt-get install ubuntu-make
# umake web visual-studio-code

notify installing vim terminator fish shell lnav autojump xinit xserver-xephyr
sudo apt-fast install -y vim terminator fish lnav autojump  xinit xserver-xephyr #lightdm i3 dmenu

notify installing jdk, gradle to setup meteor android env
sudo apt-fast install -y default-jdk gradle

notify installing meteor
#curl https://install.meteor.com/ | sh
sudo ./meteor.install.sh

notify upgrading packages
sudo apt-fast upgrade -y

notify cleaning apt
sudo apt-fast autoremove
sudo apt-fast autoclean
