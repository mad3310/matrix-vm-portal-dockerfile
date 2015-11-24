FROM 10.160.140.32:5000/letv-centos6
MAINTAINER yaofali.zhou <yaofaliang@letv.com>

RUN rpm -ivh http://pkg-repo.oss.letv.com/pkgs/centos6/letv-release.noarch.rpm 
RUN yum install java-1.6.0-openjdk-devel -y
RUN rm -f /opt/letv/jetty/contexts/test.xml

USER root

ADD ./file/lcp.war /opt/letv/jetty/webapps/lcp.war 
ADD ./file/lcp.xml /opt/letv/jetty/contexts/lcp.xml
ADD ./file/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar /opt/letv/jetty/lib/ext/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar
ADD ./file/jettyapp.xml /opt/letv/jetty/etc/jetty.xml
ADD ./file/jetty-web.xml /opt/letv/jetty/jetty-web.xml

ADD ./file/3306configuration.json /etc/gbalancer/3306configuration.json
ADD ./file/init.sh /opt/letv/init.sh

RUN chmod 755 /etc/init.d/jetty
RUN chmod 755 /etc/init.d/gbalancer
RUN chmod 755 /opt/letv/init.sh


ENTRYPOINT bash /opt/letv/init.sh && /bin/bash
