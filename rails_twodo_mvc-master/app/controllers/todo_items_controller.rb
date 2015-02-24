class TodoItemsController < ApplicationController
  before_action :find_task_list

  def index
    @new_todo = TodoItem.new
    @todo_items = @task_list.todo_items
  end

  def create
    @todo_item = @task_list.todo_items.create(params.require(:todo_item).permit(:name, :date))
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js { @todo_items = TodoItem.all }
    end
  end

  def update
    @todo_item = @task_list.todo_items.find(params[:id])
    @todo_item.update(params.require(:todo_item).permit(:complete, :name))
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js { @todo_items = TodoItem.all }
    end
  end

  def destroy
    @todo_item = @task_list.todo_items.find(params[:id])
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js { @todo_items = TodoItem.all }
    end
  end

  def toggle_all
    # check all the items, and mark them all complete
    @task_list.todo_items.update_all complete: true
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js {}
    end
  end

  def clear_all
    @task_list.todo_items.where(complete: true).destroy_all
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js {}
    end
  end

  private

  def find_task_list
    @user = User.find(session[:user_id])
    @task_list = @user.task_lists.find(params[:task_list_id])
  end
end
