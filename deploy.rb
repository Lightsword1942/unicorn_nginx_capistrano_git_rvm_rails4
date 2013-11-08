set :application, "YOUR PROJECT NAME"
set :repo_url, 'git@github.com:GH_USERNAME/PROJECT_NAME.git'
set :deploy_to, '/var/www/PROJECT_NAME'

set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:all), in: :sequence, wait: 5 do
      within release_path do
        rake "unicorn:graceful_restart"
      end
    end
  end

  task :start do
    within release_path do
      rake "unicorn:start"
    end
  end

  task :stop do
    within release_path do
      rake "unicorn:stop"
    end
  end

  after :finishing, 'deploy:cleanup'

end
