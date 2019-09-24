#!/usr/bin/env bash

echo ""
echo "=============================="
echo "Set permissions"
echo "=============================="
echo ""

chmod 700 ~/.ssh/
chmod 400 ~/.ssh/*
sudo chown -v $USER ~/.ssh/known_hosts
chmod u+w ~/.ssh/known_hosts

echo "OK"
