class Company < ActiveRecord::Base
  has_many :game
  validates :name, :presence => true
  validates :country, :presence => true
  validates :city, :presence => true
  validates :address, :presence => true
  validates :zip, :presence => true

end
