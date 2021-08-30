Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins %w[localhost:8080]

    resource '*',
      headers: :any,
      credentials: true,
      expose: %w[access-token uid client expiry],
      methods: %i[get post put patch delete options head]
  end
end
