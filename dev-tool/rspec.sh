#!/bin/bash

# Railsのサーバーを立ち上げます
# 環境変数に WEB_PORT があることが前提です
# STOP は Ctrl + c

bundle exec rails db:migrate RAILS_ENV=test
bundle exec rspec
