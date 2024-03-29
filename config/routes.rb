Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'posts#index'
  get '/', to: 'posts#index', as: 'homepage'
  get '/home', to: 'posts#index'

  resources :authors do
    resources :posts do
      resources :comments, only: %i[new create]
    end
  end
  resources :posts do
    resources :comments, only: [:index]
  end
  resources :users
end
