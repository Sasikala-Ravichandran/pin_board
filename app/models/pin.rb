class Pin < ActiveRecord::Base

  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, 
                            default_url: "/images/:style/missing.png"
  
  validates :title, length: { minimum: 3 }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  acts_as_votable

end