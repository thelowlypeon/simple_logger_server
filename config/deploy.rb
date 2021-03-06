# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "simple_logger"
set :repo_url, "git@github.com:thelowlypeon/simple_logger_server.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/"
