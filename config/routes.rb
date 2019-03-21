Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only: %i[create destroy]
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  get 'search_stocks', to: 'stocks#search'
  get 'portfolio', to: 'users#portfolio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
