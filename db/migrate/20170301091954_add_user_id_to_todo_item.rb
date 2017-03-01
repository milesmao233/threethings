class AddUserIdToTodoItem < ActiveRecord::Migration[5.0]
  def change
    add_column :todo_items, :user_id, :integer
  end
end
