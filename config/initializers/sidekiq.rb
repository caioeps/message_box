# three pumas = 3 connections
Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end
