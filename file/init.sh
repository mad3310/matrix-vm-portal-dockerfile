#!/bin/bash
cd /opt/letv/jetty/webapps/
mkdir lcp
cd lcp
jar -xvf /opt/letv/jetty/webapps/lcp.war
cp /opt/letv/jetty/jetty-web.xml /opt/letv/jetty/webapps/lcp/WEB-INF/
rm -rf /opt/letv/jetty/webapps/lcp.war
