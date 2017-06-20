class CreateSharedArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_artworks do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false

      t.timestamps
    end
    add_index :shared_artworks, :artwork_id
    add_index :shared_artworks, :viewer_id
  end
end
