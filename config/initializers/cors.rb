Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://booking-doctor-appointment-front-end.vercel.app', 'http://localhost:3000'
    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
