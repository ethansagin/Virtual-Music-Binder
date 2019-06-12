class FoldersPieces < ActiveRecord::Migration
  def change
    create_table :folders_pieces do |t|
      t.integer :folder_id
      t.integer :piece_id
    end
  end
end
