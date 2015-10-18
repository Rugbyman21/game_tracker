class Genre < ActiveRecord::Base
  has_many :game
  validates :name, :presence => true
end
