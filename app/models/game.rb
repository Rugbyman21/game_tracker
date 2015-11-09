class Game < ActiveRecord::Base
  acts_as_votable
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :genre
  belongs_to :company
  validates :title, :presence => true
  validates :rating, :presence => true

  default_scope {
    order('title ASC')
  }

end
