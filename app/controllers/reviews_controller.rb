class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.new(review_params)
      if @review.save
        redirect_to genre_path(@game.genre)
      else
        render :new
      end
  end

  def destroy
    game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    review.destroy
    redirect_to  genre_game_path(@genre, game.review)
  end

  private
    def review_params
      params.require(:review).permit(:author, :content)
    end
end
