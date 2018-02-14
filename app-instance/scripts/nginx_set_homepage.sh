#!/bin/bash

INSTANCE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

sudo echo 'this is: '$INSTANCE_IP > /var/www/html/index.html
