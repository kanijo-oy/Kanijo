Rails.application.routes.draw do
  resources :log_entries
  resources :glocs
  resources :places

  get 'home/index'
  get 'home/policy'
  get 'home/help'

  get 'home/tos'
  patch 'home/tos'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omniauth_callbacks'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
