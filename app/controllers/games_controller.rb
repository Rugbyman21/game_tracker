class GamesController < ApplicationController
  before_action :set_game, only: [:upvote, :downvote]
  def index
    # @games = Game.all
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

  def destroy
    game = Game.find(params[:id])
    @genre = game.genre
    game.destroy
    redirect_to genre_path(@genre)
  end

  def edit
    @game = Game.find(params[:id])
    @genre = Genre.find(params[:genre_id])
  end

  def update
   @game = Game.find(params[:id])
   @genre = Genre.find(params[:genre_id])
   if @game.update(game_params)
     redirect_to genre_path(@genre)
   else
     render :edit
   end
 end

  def upvote
    @game.upvote_from current_user
    redirect_to genre_game_path(@genre, @game)
  end

  def downvote
    @game.downvote_from current_user
    redirect_to genre_game_path(@genre, @game)
  end


private
  def set_game
    @game = Game.find(params[:id])
    @genre = Genre.find(params[:genre_id])
  end
  def game_params
    params.require(:game).permit(:title, :rating, :image)
  end
end
