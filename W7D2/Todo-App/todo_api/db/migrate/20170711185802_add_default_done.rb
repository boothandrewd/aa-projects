class AddDefaultDone < ActiveRecord::Migration[5.1]
  def change
    change_column :todos, :done, :boolean, null: false, default: false
  end
end
