FROM debian
COPY keyb /tmp/.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  xfce4 xfce4-goodies \
  tightvncserver \
  sudo \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /verbs
WORKDIR /root
ENV VNCPASSWORD W@lkom0123
RUN mkdir .vnc
RUN /bin/bash -c "echo -e \"$VNCPASSWORD\n$VNCPASSWORD\nn\" | vncpasswd"; echo;
RUN chmod 600 .vnc/passwd
RUN chmod 700 .vnc
COPY startup.sh .
RUN touch log.log
RUN chmod 755 *.sh
CMD [ "/root/startup.sh" ]
