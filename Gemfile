source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

gem 'active_model_serializers', '~> 0.10.0'
gem 'ckeditor', '~> 4.2.4'
gem 'devise', '~> 4.3'
gem 'draper', '~> 3.0'
gem 'dotenv-rails', '~> 2.2.0'
gem 'ffaker'
gem 'font-awesome-rails', '~> 4.7.0'
gem 'jbuilder', '~> 2.5'
gem 'material_icons', '~> 2.2.1'
gem 'materialize-sass'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'simple_token_authentication', '~> 1.0'
gem 'slim-rails', '~> 3.1.3'
gem 'rails', '~> 5.1.4'
gem 'react-rails', '~> 2.4.3'
gem 'redis', '~> 3.0'
gem 'reform', '~> 2.2.0'
gem 'reform-rails'
gem 'sass-rails', '~> 5.0.0'
gem 'uglifier'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'rspec-rails', '~> 3.6'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'foreman'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'simplecov', require: false
end

