require 'rails_helper'

describe "add a game process" do
  it "adds a new game" do
    genre = Genre.create({name: "Mature"})
    visit genre_path(genre)
    click_on "Add a Game"
    fill_in "Title", with: "Halo"
    fill_in "Rating", with: 6
    click_on "Create Game"
    expect(page).to have_content "Halo"
  end

  it "gives an error when no name is entered" do
    genre = Genre.create({name: "Mature"})
    visit new_genre_game_path(genre)
    click_on "Create Game"
    expect(page).to have_content "error"
  end
end

describe "edit a game process" do
  it "edit a game" do
    genre = Genre.create(name: "Mature")
    game = Game.create({title: "Halo", rating: 7, genre_id: genre.id})
    visit genre_game_path(genre, game)
    click_on "Update"
    fill_in "Title", with: "Halo2"
    fill_in "Rating", with: 4
    click_on "Update Game"
    expect(page).to have_content "Halo2"
  end
end

describe "delete a game process" do
  it "delete a game" do
    genre = Genre.create(name: "Mature")
    game = Game.create({title: "Halo", rating: 7, genre_id: genre.id})
    visit genre_game_path(genre, game)
    click_on "Delete"
    expect(page).to have_no_content "Halo"
  end
end
