require 'rack/cors'

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"

    resource "*",
      headers: ["Access-Control-Allow-Origin", "Access-Control-Allow-Methods", "Access-Control-Allow-Headers"],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
