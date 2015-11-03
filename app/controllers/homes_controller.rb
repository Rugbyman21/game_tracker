class HomesController < ApplicationController
  def index
    # render template: "home"

    if user_signed_in?
      redirect_to genres_path

    else

      render template: "home"
    end
    # @games = Game.all
  end
end
