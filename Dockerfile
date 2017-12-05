FROM debian:jessie
RUN echo 'deb http://security.debian.org/ jessie/updates main' > /etc/apt/sources.list
RUN echo 'deb http://debian.xtdv.net/debian jessie main' >> /etc/apt/sources.list
RUN echo 'deb http://debian.xtdv.net/debian jessie-updates main' >> /etc/apt/sources.list
RUN echo 'deb http://debian.xtdv.net/debian jessie-backports main' >> /etc/apt/sources.list
RUN apt update
RUN apt-get install curl net-tools vim libfontconfig --no-install-recommends --no-install-suggests -y
RUN curl --insecure -JLO https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_4.6.2_amd64.deb
RUN curl -JLO http://repo.zabbix.com/zabbix/3.4/debian/pool/main/z/zabbix-release/zabbix-release_3.4-1+jessie_all.deb
RUN dpkg -i grafana_4.6.2_amd64.deb
RUN dpkg -i zabbix-release_3.4-1+jessie_all.deb
CMD [ "/sbin/init" ]
