Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # rails generate controller users index show new edit
  # rails generate controller offers index new
  # rails generate controller bookings index show new edit
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [:destroy] do
    resources :offers, only: [:new, :create, :edit, :update]
  end
  resources :offers, only: [:index, :destroy]

end
