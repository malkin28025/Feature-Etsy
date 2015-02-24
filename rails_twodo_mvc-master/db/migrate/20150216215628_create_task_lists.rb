class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.integer :user_id
      t.string :name
      t.timestamps null: false
    end

    rename_column :todo_items, :user_id, :task_list_id
  end
end
