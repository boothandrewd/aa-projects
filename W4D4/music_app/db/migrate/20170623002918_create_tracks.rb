class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.text :lyrics
      t.boolean :bonus, null: false, default: false

      t.timestamps
    end
  end
end
