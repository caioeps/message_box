server '184.73.78.45', roles: [:app, :db], primary: true

set :stage,     'production'
set :rails_env, 'production'
set :puma_env,  'production'
