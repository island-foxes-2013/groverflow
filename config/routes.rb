Groverflow::Application.routes.draw do
  resources :users, :only => [:new, :create]
  root :to => 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  match 'login' => 'sessions#new', :as => "login"

end
