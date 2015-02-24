class ChangeTodoItemCompleteDefaultToFalse < ActiveRecord::Migration
  def change
    change_column_default :todo_items, :complete, false
    TodoItem.where(complete: nil).update_all complete: false
  end
end
