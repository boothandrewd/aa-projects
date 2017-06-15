class AddNonNull < ActiveRecord::Migration[5.0]
  def change
    change_column :shortened_urls, :user_id, :integer, null: false
  end
end
