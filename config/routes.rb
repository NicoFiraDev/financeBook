Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations'} #new Ruby 1.9 hash syntax
  resources :user_stocks, only: %i[create destroy]
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  resources :users, only: [:show]
  resources :friendships
  root to: redirect('/users/sign_in')
  get 'search_stocks', to: 'stocks#search'
  get 'portfolio', to: 'users#portfolio'
  get 'friends', to: 'users#friends'
  get 'search/friends', to: 'users#search'
  get 'stock/:stock', to: 'stocks#show', as: 'stock'
  post 'add_friend', to: 'users#add_friend'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
