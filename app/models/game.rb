class Game < ActiveRecord::Base
  belongs_to :genre
  belongs_to :company
  validates :title, :presence => true
  validates :rating, :presence => true

  default_scope {
    order('title ASC')
  }

end
