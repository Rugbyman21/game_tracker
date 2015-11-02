require 'rails_helper'

describe "the add genre process" do
  it "adds a new genre" do
    visit genres_path
    click_on "New Genre"
    fill_in "Name", with: "Mature"
    click_on "Create Genre"
    expect(page).to have_content "Mature"
  end

  it "will give errors if genre isn't saved" do
    visit new_genre_path
    click_on "Create Genre"
    expect(page).to have_content 'error'
  end
end

describe "delete genre path" do
  it "will delete a genre" do
    genre = Genre.create({name: "Mature"})
    game = Game.create({title: "Halo", rating: 7, genre_id: genre.id})
    visit genre_path(genre, game)
    click_on "Delete"
    expect(page).to have_no_content "Mature"
  end
end

describe "update genre path" do
  it "will update a genre" do
    genre = Genre.create({name: "Mature"})
    visit genre_path(genre)
    click_on "Update"
    fill_in "Name", with: "Teen"
    click_on "Update Genre"
    expect(page).to have_content "Teen"
  end
end
