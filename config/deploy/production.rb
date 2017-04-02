server 'simple_logger',
  user: 'deploy',
  roles: %w{app web}

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      puts `pwd`
      `/home/deploy/bin/unicorn_server restart`
    end
  end

  after :finishing, "deploy:cleanup"
end
