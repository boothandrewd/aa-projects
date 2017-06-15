class AddNullProtection < ActiveRecord::Migration[5.0]
  def change
    change_column :answer_choices, :question_id, :integer, null: false
    change_column :questions, :poll_id, :integer, null: false
    change_column :responses, :user_id, :integer, null:false
    change_column :responses, :answer_choice_id, :integer, null: false
  end
end
