source 'https://rubygems.org'

gem 'rack'
gem "pg"
gem "sinatra-activerecord", require: 'sinatra/activerecord'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'capistrano', '~> 3.0'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
end
