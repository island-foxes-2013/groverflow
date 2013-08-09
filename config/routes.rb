Groverflow::Application.routes.draw do
  resources :users, :only => [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :new, :show, :create, :destroy]
  match 'login' => 'sessions#new', :as => "login"
  root :to => 'questions#index'

end
