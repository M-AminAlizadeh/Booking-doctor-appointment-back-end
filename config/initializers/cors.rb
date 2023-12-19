Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://booking-doctor-iqa1.onrender.com', 'https://booking-doctor-appointment-front-end-git-76855a-m-aminalizadeh.vercel.app/'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
