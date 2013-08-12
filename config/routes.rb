Groverflow::Application.routes.draw do

  root :to => 'questions#index'
  match 'login' => 'sessions#new', :as => :login
  resources :users, :only => [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :new, :create, :show] do
    resources :votes, only: [:create, :update, :destroy] 
    resources :answers, only: [:create]
    resources :comments, only: [:create]

  end

  resources :answers, only: [] do
    resources :votes, only: [:create, :update, :destroy]
    resources :comments, only: [:create]
  end

end
