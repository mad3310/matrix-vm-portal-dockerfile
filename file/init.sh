#!/bin/bash
cd /opt/letv/jetty/webapps/
mkdir lcp
cd lcp
jar -xvf /opt/letv/jetty/webapps/lcp.war
cp /opt/letv/jetty/jetty-web.xml /opt/letv/jetty/webapps/lcp/WEB-INF/
rm -rf /opt/letv/jetty/webapps/lcp.war

cd /etc/alternatives
rm -rf java javac
ln -s /usr/lib/jvm/java-1.6.0-openjdk.x86_64/bin/java java
ln -s /usr/lib/jvm/java-1.6.0-openjdk.x86_64/bin/javac javac

umount /etc/hosts
echo -e "10.176.127.32 matrix.letvcloud.com" >> /etc/hosts
echo -e "10.150.149.34 uc.letvcloud.com" >> /etc/hosts