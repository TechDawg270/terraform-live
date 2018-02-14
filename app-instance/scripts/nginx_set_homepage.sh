#!/bin/bash

INSTANCE_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

sudo echo 'this is (public IP): '$INSTANCE_IP > /var/www/html/index.html
