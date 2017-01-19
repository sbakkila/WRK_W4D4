class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :album_id
      t.integer :year, null: false
      t.timestamps
    end
  end
end
