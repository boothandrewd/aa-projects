class AddIndicesToVisits < ActiveRecord::Migration[5.0]
  def change
    add_index :visits, :user_id
    add_index :visits, :surl_id
  end
end
