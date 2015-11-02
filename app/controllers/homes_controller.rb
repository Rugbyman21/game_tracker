class HomesController < ApplicationController
  def index
    render template: "home"
    # @games = Game.all
  end
end
