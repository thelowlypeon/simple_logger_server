# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "simple_logger"
set :repo_url, "git@bitbucket.org:thelowlypeon/simple_logger.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/"
