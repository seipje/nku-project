class Artist < ActiveRecord::Base 
  
  has_secure_password
  has_many :pieces, 
    dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  validates :name, 
    :presence => true, 
    :length => { :minimum => 3 }, 
    :uniqueness => true
 
  
  validates :email,  
    :uniqueness => true

end