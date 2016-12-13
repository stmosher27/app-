class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, null: false
      t.integer :year, null: false
      t.boolean :live, default: false, null: false

      t.timestamps null: false
    end

    add_index :albums, :title, unique: true
    add_index :albums, :band_id
  end
end
