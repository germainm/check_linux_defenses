if [ `which aa-status 2>/dev/null` ]; then
    aa-status
elif [ `which apparmor_status 2>/dev/null` ]; then
    apparmor_status
elif [ `ls -d /etc/apparmor* 2>/dev/null` ]; then
    ls -d /etc/apparmor*
else
    echo "Not found AppArmor"
fi

((uname -r | grep "\-grsec" >/dev/null 2>&1 || grep "grsecurity" /etc/sysctl.conf >/dev/null 2>&1) && echo "Yes" || echo "Not found grsecurity")

(which paxctl-ng paxctl >/dev/null 2>&1 && echo "Yes" || echo "Not found PaX")

(grep "exec-shield" /etc/sysctl.conf || echo "Not found Execshield")

 (sestatus 2>/dev/null || echo "Not found sestatus")

 aslr=$( cat /proc/sys/kernel/randomize_va_space 2>/dev/null)
 #If 0, not enabled
 if [ $aslr = "0" ]; then
	 echo "aslr not set"
 else
	 echo "aslr is set"
 fi
