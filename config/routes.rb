Groverflow::Application.routes.draw do

  root :to => 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  match 'login' => 'sessions#new', :as => "login"
end
