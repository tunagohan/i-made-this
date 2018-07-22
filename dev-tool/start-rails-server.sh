#!/bin/bash

# Railsのサーバーを立ち上げます
# 環境変数に WEB_PORT があることが前提です
# STOP は Ctrl + c

bundle exec rails s -b 0.0.0.0 -p $WEB_PORT
