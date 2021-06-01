#!/bin/bash -l

echo "200"
nginx -t 2>&1 && nginx -s reload 2>&1