#!/bin/bash

systemctl link $(realpath ./nginx-app.service)
systemctl enable nginx-app
systemctl start nginx-app