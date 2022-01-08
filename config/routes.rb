Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  root to: 'pages#homepage'
  get '/', to: 'pages#homepage', as: 'homepage'
  get '/home', to: 'pages#homepage'
end
