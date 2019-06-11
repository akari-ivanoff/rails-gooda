Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # rails generate controller users index show new edit
  # rails generate controller offers index new
  # rails generate controller invitations index show new edit
  devise_for :users
  root to: 'pages#home'

  resources :offers, only: [:new, :create, :edit, :update]
  resources :offers, only: [:index, :destroy]
  resources :invitations, only: [:create, :show] # we won't need a show page since we will show the results in the dashboard

  #create dashboard controller with index
end
