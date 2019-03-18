Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  get 'search_stocks', to: 'stocks#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
