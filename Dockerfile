FROM 10.160.140.32:5000/letv-centos6
MAINTAINER yaofali.zhou <yaofaliang@letv.com>

RUN rpm -ivh http://pkg-repo.oss.letv.com/pkgs/centos6/letv-release.noarch.rpm 
RUN yum install jetty -y
RUN yum install vim -y
RUN yum install java-1.6.0-openjdk-devel -y
RUN yum install gbalancer -y
RUN rm -f /opt/letv/jetty/contexts/test.xml

EXPOSE 8080 8081
USER root

ADD ./file/webportal-webapp.war /opt/letv/jetty/webapps/webportal-webapp.war 
ADD ./file/webportal-webapp.xml /opt/letv/jetty/contexts/webportal-webapp.xml
ADD ./file/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar /opt/letv/jetty/lib/ext/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar
ADD ./file/jettyapp.xml /opt/letv/jetty/etc/jetty.xml
ADD ./file/jetty-web.xml /opt/letv/jetty/jetty-web.xml

ADD ./file/jetty /etc/init.d/jetty
ADD ./file/gbalancer /etc/init.d/gbalancer
ADD ./file/cu.sh /opt/letv/jetty/cu.sh
ADD ./file/3306configuration.json /3306configuration.json
ADD ./file/init.sh /opt/letv/init.sh

RUN chmod 755 /etc/init.d/jetty
RUN chmod 755 /etc/init.d/gbalancer
RUN chmod 755 /opt/letv/jetty/cu.sh
RUN chmod 755 /opt/letv/init.sh
RUN bash /opt/letv/jetty/cu.sh


ENTRYPOINT bash /opt/letv/init.sh && /bin/bash
