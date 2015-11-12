class HomesController < ApplicationController

  def index


    if current_user
      render template: "home"

    else

      redirect_to user_session_path
    end
    # @games = Game.all
  end
end
