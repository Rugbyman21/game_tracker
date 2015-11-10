class Genre < ActiveRecord::Base
  has_many :games
  validates :name, :presence => true

  default_scope {
    order('upper(name)')
  }

end
