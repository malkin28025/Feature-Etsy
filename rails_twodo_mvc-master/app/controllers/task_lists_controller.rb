class TaskListsController < ApplicationController
  before_action :find_user

  def index
    @task_lists = @user.task_lists
    @task_list = TaskList.new
  end

  def create
    @task_list = @user.task_lists.create(params.require(:task_list).permit(:name))
    redirect_to root_url
  end

  def show
    #should show a blank todo list (or a preexisting list)
  end
  private

  def find_user
    @user = User.find(session[:user_id])
  end
end
