class Piece < ActiveRecord::Base
  belongs_to :artist
  
  has_attached_file :photo, :styles => {:small => '150x150>' }
  
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end