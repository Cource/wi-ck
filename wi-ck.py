#!/bin/python3
import sys
import os

#alias
def sh(arg):
    os.system(arg)

sh('hash aircrack-ng 2>/dev/null || echo "[!]wi-ck requires aircrack-ng but it is not installed. Install  it using \'apt install aircrack-ng\'"')
sh('hash xterm 2>/dev/null || echo "[!]wi-ck requires xterm but it is not installed.  Install it using \'apt install xterm\'"')

x = sys.argv[1:]

for i in range(len(x)):
    if x[i] in ('-h', '--help'):
        print('           _            _\n'
		' __      _(_)       ___| | __\n'
		' \\ \\ /\\ / / |_____ / __| |/ /\n'
		'  \\ V  V /| |_____| (__|   <\n'
		'   \\_/\\_/ |_|      \\___|_|\\_\\\n'
		'\n'
        '                       v(p-0.0.3)\n'
        '\n'
        'wi-ck wifi cracking automation script\n'
		'Usage: wi-ck <path>\n'
		'Saves the capture file to <path>\n'
		'\n'
		'Arguments:\n'
		'-h, --help			Displays this help\n'
		'-v, --version			Displays the version of wi-ck\n'
		'-s, --stop			Stop the monitor interface\n'
		'-c, --crack <wordlist> <capfile>	crack the capture file\n'
		'->(kali users: use _k or _kali instead of <wordlist> to use rockyou.txt.gz)\n')
        exit()
    elif x[i] in ('-s','--stop'):
        sh('airmon-ng stop wlan0mon')
    elif x[i] in ('-v', '--version'):
        print('wifi-crack v(p-0.0.3)')
    elif x[i] in ('-c','--crack'):
        if x[i+1] == '_k' or '_Kali':
            wordlist = '/usr/share/wordlists/rockyou.txt'
        else:
            wordlist = x[i+1]
        capfile = x[i+2]
        sh('xterm -e aircrack-ng -w ' + wordlist + ' ' + capfile)
    elif '-' in x[i]:
        print('Invalid Option: ', x[i])
        exit()
    elif len(x) == 1:
        print('[+]Starting the monitor interface')
        sh('airmon-ng start wlan0')
        print('[+]Dumping the traffic and handshakes to', x[0])
        sh('xterm -e airodump-ng wlan0mon -w ' + x[0])
if len(x) == 0:
    print('[+]Starting the monitor interface')
    sh('airmon-ng start wlan0')
    print("[+]Dumping the traffic and handsakes to '/tmp/capture'")
    sh('xterm -e airodump-ng wlan0mon -w /tmp/capture')
