class Review < ActiveRecord::Base
  belongs_to :game

  validates :author, :presence => true
  validates :content, :presence => true
end
