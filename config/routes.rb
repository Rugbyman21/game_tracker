Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root :to => "homes#index"

  resources :genres do
    resources :games do
      member do
        put "like" => "games#upvote"
        put "unlike" => "games#downvote"
      end
    end
  end

  resources :games, :except => [:index, :create, :new, :edit, :show, :update, :destroy] do
    resources :reviews, :only => [:create, :new, :show]
  end


end
