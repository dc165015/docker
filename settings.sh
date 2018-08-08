
cd $HOME

# reconfigure timezone
#echo "Asia/Shanghai" | tee /etc/timezone

#localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

notify appending .bashrc
echo '
#export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=:0
export NO_AT_BRIDGE=1
#sudo service dbus start
#/etc/init.d/dbus start
#exec dbus-run-session -- bash
#export PULSE_SERVER=tcp:localhost

alias inst="apt-fast install -y"
alias srcbak="cp /etc/apt/sources.list.bak /etc/apt/sources.list"
alias src163="cp /etc/apt/163.xenial.sources.list /etc/apt/sources.list"
alias srcup="apt-fast update"
alias mn="meteor npm"
alias mni="meteor npm i"
alias mnr="meteor npm run"

PS1="\n\e[0;33m  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  \e[m\n$PS1"

[[ -f /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh

' | tee -a ~/.bashrc

notify appending .profile
echo '
if [ -d "/mnt/d/Coding" ]; then
    if [ ! -d "/coding"]; then
      ln -s /mnt/d/Coding  /coding ;
    fi
fi

if [ ! -d "/coding" ]; then
    sudo mkdir /coding
fi

if [ $(ls /coding | wc -l) -eq 0 ]; then
    sudo mount -t cifs -o username=dc,password=s3Sworld,nounix,nocase //dc0/coding/ /coding ;
fi


' | tee -a ~/.profile

#cp /coding/tools/vagrant/lightdm.conf /etc/lightdm/lightdm.conf
#cp /coding/tools/vagrant/xorg.conf /etc/X11/xorg.conf
#如果想 Ubuntu 在每次启动到 command prompt ，可以输入以下指令:
#echo “false” | tee /etc/X11/default-display-manager
#当下次开机时，就会以命令行模式启动（text模式，字符界面登录），如果想变回图形界面启动（X windows启动），可以輸入:
echo “/usr/sbin/lightdm” | tee /etc/X11/default-display-manager
echo 'exec i3' > ~/.xinitrc
#如果在Ubuntn以命令行模式启动，在字符终端想回到图形界面的话只需以下命令:
#startx

cat ./vimrc >> ~/.vimrc

setsudoer
