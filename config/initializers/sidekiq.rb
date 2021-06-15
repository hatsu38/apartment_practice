Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV.fetch("REDIS_URL", "localhost:6379")}", namespace: "sidekiq" }
  config.on(:startup) do
    FileUtils.touch(Rails.root.join("tmp", "pids", "sidekiq_started.pid"))
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV.fetch("REDIS_URL", "localhost:6379")}", namespace: "sidekiq" }
  config.on(:startup) do
    FileUtils.touch(Rails.root.join("tmp", "pids", "sidekiq_started.pid"))
  end
end