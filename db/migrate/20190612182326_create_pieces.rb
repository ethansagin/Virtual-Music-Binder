class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :from_work
      t.integer :year
      t.string :composer
      t.string :lyricist
      t.string :genre
      t.string :language
      t.string :translation
    end
  end
end
