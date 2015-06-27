#!/bin/sh
# http://debian.neo4j.org/?_ga=1.263482764.1468454145.1435401838
# http://www.delimited.io/blog/2014/1/15/getting-started-with-neo4j-on-ubuntu-server

sudo sh -c 'wget -O - http://debian.neo4j.org/neotechnology.gpg.key| apt-key add -'
sudo sh -c 'echo "deb http://debian.neo4j.org/repo stable/" > /etc/apt/sources.list.d/neo4j.list'
sudo apt-get update
sudo apt-get install -y neo4j
service neo4j-service status
