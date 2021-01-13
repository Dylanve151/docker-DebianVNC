#!/bin/bash
#startup script

if [ -z "$VNCPASSWORD" ]
then
	echo "VNCPASSWORD" >> log.log
else
	vncpasswd -f <<<"$VNCPASSWORD" > /root/.vnc/passwd
	chmod 600 /root/.vnc/passwd
fi
sudo tightvncserver :1 --httpport 5900
tail -fn0 log.log
