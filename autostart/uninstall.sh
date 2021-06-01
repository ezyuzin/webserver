#!/bin/bash

systemctl stop nginx-app
systemctl disable nginx-app
systemctl revert nginx-app