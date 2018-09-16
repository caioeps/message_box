def current_git_branch
  `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
end

set :repo_url,     'git@github.com:caioeps/message_box.git'
set :application,  'message_box'
set :user,         'deploy'
set :puma_threads, [1, 2]
set :puma_workers, 0
set :branch,       current_git_branch
set :bundle_without, [:development, :test]

set :stage,     'production'
set :rails_env, 'production'
set :puma_env,  'production'

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     forward_agent: true, user: fetch(:user), keys: %w[~/.ssh/id_rsa.pub]
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to true if using ActiveRecord

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w[.env]
set :linked_dirs, %w[bin log tmp/pids tmp/cache tmp/sockets vendor/bundle]

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Install front dependencies'
  task :yarn do
    on roles(:web) do
      within release_path do
        execute "cd #{release_path} && yarn install --production --no-progress"
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  desc 'Updated Nginx conf'
  task :copy_nginx_conf do
    on roles(:app), in: :sequence do
      execute :sudo, "rm /etc/nginx/sites-enabled/#{fetch(:application)}"
      execute :sudo, "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      execute :sudo, 'service nginx restart'
    end
  end

  after  :finishing,      :compile_assets
  before :compile_assets, :'deploy:yarn'
  after  :finishing,      :cleanup
  after  :finishing,      :copy_nginx_conf
  after  :finishing,      :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
