class TasksController < ApplicationController
  def index
    @task_lists = TaskList.all    
  end
end
