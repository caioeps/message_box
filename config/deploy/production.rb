server '54.91.230.67', roles: [:app, :db, :web], primary: true

set :stage,     'production'
set :rails_env, 'production'
set :puma_env,  'production'
