class CatForeignKey < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer, null: false, default: 11
    add_index :cats, :user_id
  end
end
