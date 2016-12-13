class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.boolean :bonus, default: false, null: false
      t.integer :album_id
      t.integer :ord, null: false
      t.text :lyrics, null: false

      t.timestamps null: false
    end

    add_index :tracks, :album_id, unique: true
    add_index :tracks, :ord, unique: true
  end
end
