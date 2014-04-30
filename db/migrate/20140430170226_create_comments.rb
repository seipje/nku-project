class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :artist_id
      t.string :body
      t.integer :piece_id
      
      t.timestamps
    end
  end
end
