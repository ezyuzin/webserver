#!/bin/bash

$LE_HOME/acme.sh --renew-all --no-color --config-home $LE_CONFIG_HOME --log $LE_LOG_HOME/acme.log --reloadcmd "sh $LE_HOME/nginx_reload.sh";