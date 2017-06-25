class AddCheerCountDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :cheer_count, :integer, default: 12
  end
end
