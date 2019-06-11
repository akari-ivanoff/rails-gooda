Rails.application.routes.draw do
  get 'dashboards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # rails generate controller users index show new edit
  # rails generate controller offers index new
  # rails generate controller invitations index show new edit
  devise_for :users
  root to: 'pages#home'
  resources :offers
  resources :invitations
  resources :dashboards, only: [:index]

end
