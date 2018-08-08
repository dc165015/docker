

echo import funcs: notify, proxy/unproxy, checksu, setsudoer

notify () {
    echo -e "\033[44;37m >>>>>>>$*<<<<<<< \033[0m"
}

proxy () {
    read -p "Would you like to connect with proxy? (NO/yes): " answer;
    if [ $answer="yes" ]; then
        local host=${1:-w2};
        local port=${2:-8888};
        [ $1 ] || read -p "please enter the host ip/name(w2): " host;
        [ $2 ] || read -p "please enter the port(8888): " port;
        local P="http://$host:$port";
        for var in https_proxy http_proxy ftp_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY; do
            export $var=$P;
        done
        for var in no_proxy NO_PROXY; do
            export $var="127.0.0.1, localhost" ;
        done
    fi
    if (! pgrep lantern) && (! exec lantern &) then
        notify installing lantern and setup proxy to 0.0.0.0:8888;
        if [ -f ./lantern-installer-64-bit.deb ]; then
            sudo dpkg -i lantern-installer-64-bit.deb;
        else
            wget -T 30 -t 2 -O - https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb | sudo dpkg -i -;
        fi
        lantern -headless -addr 0.0.0.0:8888 > /dev/null 2>&1
    fi
}

unproxy () {
    killall -v lantern
    for var in https_proxy http_proxy HTTP_PROXY HTTPS_PROXY; do
        unset $var;
    done
}

setsudoer () {
    local user;

    if [[ -z $1 ]]; then
        read -p "please enter the username: " name;
        user=${name:-$USER};
    else
        user=$1;
    fi

    if [ ! -d "/etc/sudoers.d" ]; then
        sudo mkdir /etc/sudoers.d/ ;
    fi

    if [ ! -f /etc/sudoers.d/$user ]; then
	notify add $user to soduers.d;
	echo "$user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$user;
    fi
}

