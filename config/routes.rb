Rails.application.routes.draw do
  resources :log_entries
  resources :glocs
  get 'home/index'
  get 'home/policy'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
