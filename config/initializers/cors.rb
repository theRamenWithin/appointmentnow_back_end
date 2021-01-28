Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ['http://localhost:3001', 'https://appointmentnow.netlify.app']
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end