# wi-ck
An easy to use tool for automating aircrack-ng  
wi-ck stands for wifi-crack (like wireless-fidelity, you get it ;) )  
usage: wi-ck [path to dump]  
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;wi-ck -c [path to cap file]

## Features:
- Automatically turns on the wireless interface and starts dumping handshakes and list of APs and probes
- Stop the monitor interface
- Crack the capture file
- Makes your life easier(if you are a hacker)
 ## Install:
To install this scirpt:
- do sudo chmod +x ./Install
- do sudo ./Install inside wi-ck folder

## Changelog:
<pre>
v(0.0.2): - Now checks if aircrack-ng and xterm are installed
	  - displays the version of the script when -v is passed

v(0.0.1): - Added a default dumping path to /tmp/crack so now you just have to 
            type 'wi-ck' and it does everything by itself 
          - Now uses xterm to display the ongoing dump
</pre>
