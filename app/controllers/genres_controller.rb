class GenresController < ApplicationController
  # before_action :authenticate_user!
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def destroy
    genre = Genre.find(params[:id])
    # game.reviews.each do |review|
    #   review.destroy
    # end
    genre.games.each do |game|
      game.destroy
    end
    genre.destroy
    redirect_to genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
