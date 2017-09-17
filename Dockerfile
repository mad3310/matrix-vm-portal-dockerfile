FROM 10.160.140.32:5000/jetty-base-ip:0.0.1
MAINTAINER zhoubin0722_cn <zhoubin0722_cn@sina.com>

RUN yum install java-1.6.0-openjdk-devel -y
RUN rm -f /opt/jetty/contexts/test.xml

USER root

ADD ./file/lcp.war /opt/jetty/webapps/lcp.war 
ADD ./file/lcp.xml /opt/jetty/contexts/lcp.xml
ADD ./file/jettyapp.xml /opt/jetty/etc/jetty.xml

ADD ./file/init.sh /opt/init.sh

RUN chmod 755 /opt/init.sh


ENTRYPOINT bash /root/init_net.sh && service jetty-manager restart && /salt_minion_init.sh  && service moxi-manager start && service gbalancer-manager start && /opt/init.sh && /bin/bash
