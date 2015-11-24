#!/bin/bash
cd /opt/letv/jetty/webapps/
mkdir webportal-webapp
cd webportal-webapp
jar -xvf /opt/letv/jetty/webapps/webportal-webapp.war
cp /opt/letv/jetty/jetty-web.xml /opt/letv/jetty/webapps/webportal-webapp/WEB-INF/
rm -rf /opt/letv/jetty/webapps/webportal-webapp.war

service gbalancer start
service jetty start
