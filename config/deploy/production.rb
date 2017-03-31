server 'simple_logger',
  user: 'deploy',
  roles: %w{app web}

namespace :deploy do
  task :restart_unicorn do
    `/home/deploy/bin/unicorn_server restart`
  end

  after "finishing", "deploy:restart_unicorn"
end

