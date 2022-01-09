Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get '/', to: 'posts#index', as: 'homepage'
  get '/home', to: 'posts#index'

  resources :author do
    resources :posts do
      resources :comments, only: %i[new create]
    end
    resources :comments
  end
  resources :posts do
    resources :comments, only: [:index]
  end
  resources :users
end
