class CreateArtist < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string   :name
      t.string   :username
      t.string   :email
      t.integer  :age
      t.string   :image_url
      t.boolean  :is_admin
      
      t.string   :password_digest

      t.timestamps
    end
  end
end
