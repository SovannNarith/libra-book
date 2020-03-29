Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home', to: 'pages#home'
  resources :books
  resources :users
  get '/log_in', to: 'sessions#log_in'
  post '/log_in' to: 'sessions#log_in'
  delete '/log_out', to: 'sessions#log_out'
end
