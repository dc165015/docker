

echo import funcs: notify, proxy/unproxy, checksu, setsudoer

notify () {
    echo -e "\033[44;37m >>>>>>>$*<<<<<<< \033[0m"
}

proxy () {
    local P="http://"${1:-dc0}":"${2:-8888};
    for var in https_proxy http_proxy ftp_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY; do
        export $var=$P;
    done
    for var in no_proxy NO_PROXY; do
        export $var="127.0.0.1, localhost" ;
    done
}

unproxy () {
    for var in https_proxy http_proxy HTTP_PROXY HTTPS_PROXY; do
        unset $var;
    done
}

setsudoer () {
    if (! checksu) then 
	return 1;
    fi

    local user;

    if [[ -z $1 ]]; then
        read -p "please enter the username: " name;
        user=${name:-$USER};
    else
        user=$1;
    fi

    if [ ! -d "/etc/sudoers.d" ]; then
        mkdir /etc/sudoers.d/ ;
    fi

    if [ ! -f /etc/sudoers.d/$user ]; then
	notify add $user to soduers.d;
	echo "$user ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/$user;
    fi
}

checksu () {
   if [ $(id -u) -eq 0 ]; then
       return 0;
   else 
       echo please run as root;
       return 1;
   fi
}
