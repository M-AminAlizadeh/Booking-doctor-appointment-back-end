Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: redirect('/api-docs/index.html')

  namespace :v1 do
    post 'users/login' => 'users#login'
    post 'users/signup' => 'users#signup'
    get 'users/fetch_current_user' => 'users#fetch_current_user'
    resources :doctors, only: [:create, :destroy, :show, :index]
    resources :reservations, only: [:create, :destroy, :show, :index]
  end
end
