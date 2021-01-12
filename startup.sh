#!/bin/bash
#startup script

if [ -z "$VNCPASSWORD" ]
then
	echo "VNCPASSWORD" >> log.log
else
	vncpasswd -f <<<"$VNCPASSWORD" > /root/.vnc/passwd
fi
tightvncserver
tail -fn0 log.log
