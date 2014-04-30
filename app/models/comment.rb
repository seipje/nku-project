class Comment < ActiveRecord::Base
  belongs_to :piece
  belongs_to :artist
  
end