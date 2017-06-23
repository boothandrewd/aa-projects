class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :recording_type, null: false, default: 'studio'

      t.timestamps
    end
  end
end
