class Artist < ActiveRecord::Base 
  
  has_secure_password
  has_many :pieces, dependent: :destroy
  
  validates :name, 
    :presence => true, 
    :length => { :minimum => 3 }, 
    :uniqueness => true
 
  
  validates :email, presence: true

end