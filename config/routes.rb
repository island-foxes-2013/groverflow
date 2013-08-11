Groverflow::Application.routes.draw do

  root :to => 'questions#index'
  match 'login' => 'sessions#new', :as => "login"
  resources :users, :only => [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :new, :create, :show, :destroy] do
    resources :votes, only: [:create, :update, :destroy] 
    resources :answers, only: [:create, :destroy] 
  end

  resources :answers, only: [] do
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :questions, only:[] do
    resources :comments, only: [:create, :update, :destroy]
  end

end
