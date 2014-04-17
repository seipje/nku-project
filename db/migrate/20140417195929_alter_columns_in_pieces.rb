class AlterColumnsInPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :piece_owner, :string
    add_column :pieces, :artist_id, :integer
  end
end
