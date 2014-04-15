class CreatePiece < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string   :piece_name
      t.string   :piece_owner
      t.string   :category
      t.text     :description
      t.timestamps
    end
  end
end
