From ubuntu:18.04
MAINTAINER github@inverse-problems.de
ENV DEBIAN_FRONTEND=noninteractive

# install repository
RUN apt-get update
RUN apt-get -y install curl software-properties-common
RUN curl https://winswitch.org/gpg.asc | apt-key add -
RUN echo "deb http://winswitch.org/ bionic main" > /etc/apt/sources.list.d/winswitch.list
RUN apt-get update

#if you want, install X11 basics. This is not needed.
#RUN apt-get install -y xorg openbox

#install xpra
# The latest version seems to have issues
#RUN apt-get install -y xpra=3.0.4-r24778-1 xpra-html5=3.0.4-r24778-1
RUN apt-get install -y xpra xpra-html5

#configure xpra
RUN apt-get install -y xterm ed
RUN mkdir /run/xpra; chmod 777 /run/xpra
RUN echo "start-child = /usr/bin/xterm" >>/etc/xpra/conf.d/60_server.conf 
RUN /bin/echo -e '/mdns\nc\nmdns = no\n.\nw\nq\n' | ed /etc/xpra/conf.d/50_server_network.conf         
RUN /bin/echo -e '/lang =\nc\nvar lang="de-de";\n.\nw\nq\n'|ed /usr/share/xpra/www/connect.html
RUN rm /usr/share/xpra/www/connect.html.*

#add a dummy user wuebbel with password wuebbel
RUN adduser wuebbel </dev/null
RUN /bin/echo -e "wuebbel\nwuebbel" | passwd wuebbel

COPY init.sh /
CMD /bin/bash /init.sh
WORKDIR /root
