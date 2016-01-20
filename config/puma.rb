#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'production'

daemonize true

pidfile "/var/www/quartermaster/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/quartermaster/shared/tmp/log/stdout", "/var/www/quartermaster/shared/tmp/log/stderr"

threads 0, 16

bind "unix:///tmp/socekts/quartermaster.sock"
