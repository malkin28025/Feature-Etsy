module TodoItemsHelper

  def due_class_for(todo_item)
    if todo_item.overdue?
      'class=overdue' 
    elsif todo_item.future?
      'class=future'
    end
  end
end
