Rails.application.routes.draw do
  devise_for :users

  root :to => "homes#index"

  resources :genres do
    resources :games
  end


end
