Rails.application.routes.draw do
  root :to => "homes#index"

  resources :genres

  devise_for :users


end
