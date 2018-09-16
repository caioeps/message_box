server '52.87.242.84', roles: [:app, :db, :web], primary: true

set :stage,     'production'
set :rails_env, 'production'
set :puma_env,  'production'
