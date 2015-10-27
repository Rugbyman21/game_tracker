class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @genre = Genre.find(params[:genre_id])
    @game = @genre.games.new
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @game = @genre.games.new(game_params)
    if @game.save
      redirect_to genre_path(@game.genre)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @genre = @game.genre
  end

  private
  def game_params
    params.require(:game).permit(:title, :rating)
  end
end
