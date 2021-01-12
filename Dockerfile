FROM debian
RUN apt-get update && apt-get install -y \
  xfce4 xfce4-goodies \
  tightvncserver \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /verbs
WORKDIR /root
ENV VNCPASSWORD W@lkom0123
RUN mkdir .vnc
RUN vncpasswd -f <<<"$VNCPASSWORD" > .vnc/passwd
RUN chmod 600 .vnc/passwd
RUN chmod 700 .vnc
COPY startup.sh .
RUN touch log.log
RUN chmod 755 *.sh
CMD [ "/root/startup.sh" ]
