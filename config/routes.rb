Groverflow::Application.routes.draw do
  resources :users, :only => [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :new, :create, :show, :destroy] do
    resources :answers, only: [:index, :new, :create, :show, :destroy]
  end
  match 'login' => 'sessions#new', :as => "login"
  root :to => 'questions#index'

end
