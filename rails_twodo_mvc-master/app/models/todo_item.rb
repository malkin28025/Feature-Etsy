class TodoItem < ActiveRecord::Base
  belongs_to :task_list

  def overdue?
    date < Date.today
  end

  def future?
    date > Date.today
  end
end
