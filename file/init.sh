#!/bin/bash
cd /etc/alternatives
rm -rf java javac
ln -s /usr/lib/jvm/java-1.6.0-openjdk.x86_64/bin/java java
ln -s /usr/lib/jvm/java-1.6.0-openjdk.x86_64/bin/javac javac
