#!/bin/bash

acme.sh --list
echo ""
#-- crontab -l

echo "cerificate update crond is running"
trap "killall crond && exit 0" SIGTERM SIGINT
crond
# while true; do sleep 5; done;
