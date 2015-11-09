Rails.application.routes.draw do
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


end
