Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  # Defines the root path route ("/")
  # root "articles#index"
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
