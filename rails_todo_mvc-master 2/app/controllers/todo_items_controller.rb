class TodoItemsController < ApplicationController
  before_action :find_todo_item, only: [ :update, :destroy, :edit ]

  def index
    @todo_item = TodoItem.new
    @all_todo_items = TodoItem.all
    if params[:complete]
      # the below converts params[:complete] into a boolean
      # complete will be true if params[:complete] is "true"
      # otherwise complete will be false
      complete = params[:complete] == "true" || false
      @all_todo_items = @all_todo_items.where(complete: complete)
    end
  end

  def create
    @todo_item = TodoItem.create(params.require(:todo_item).permit(:description))
    redirect_to root_url
  end

  def update
    @todo_item.update(params.require(:todo_item).permit(:complete, :description))
    redirect_to root_url
  end

  def destroy
    @todo_item.destroy
    redirect_to root_url
  end

  def clear_completed
    TodoItem.where(complete: true).update_all(complete: false)
    redirect_to root_url
  end

  def edit
  end

  private

    def find_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

end
