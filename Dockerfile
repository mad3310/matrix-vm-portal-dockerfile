FROM 10.160.140.32:5000/letv-jetty-base-ip:0.0.1
MAINTAINER liuhao <liuhao1@letv.com>

RUN yum install java-1.6.0-openjdk-devel -y
RUN rm -f /opt/letv/jetty/contexts/test.xml

USER root

ADD ./file/lcp.war /opt/letv/jetty/webapps/lcp.war 
ADD ./file/lcp.xml /opt/letv/jetty/contexts/lcp.xml
ADD ./file/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar /opt/letv/jetty/lib/ext/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar
ADD ./file/jettyapp.xml /opt/letv/jetty/etc/jetty.xml
ADD ./file/jetty-web.xml /opt/letv/jetty/jetty-web.xml

ADD ./file/init.sh /opt/letv/init.sh

RUN chmod 755 /opt/letv/init.sh


ENTRYPOINT bash /root/init_net.sh && service jetty-manager restart && /salt_minion_init.sh  && service gbalancer-manager start&& /opt/letv/init.sh && /bin/bash
