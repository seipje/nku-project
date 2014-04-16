class Piece < ActiveRecord::Base
  belongs_to :artist
  
  has_attached_file :photo, :styles => {:small => '150x150>' }, :url => "/assets/pieces/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/pieces/:id/:style/:basename.:extension"
  
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end