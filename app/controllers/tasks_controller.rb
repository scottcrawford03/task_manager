class TasksController < ApplicationController
  def index
    @task_lists = TaskList.where(archived: false)    
  end

  def new
    @task_list = TaskList.find(params[:task_list_id])
  end

  def create
    task_list = TaskList.find(params[:task][:task_list])
    task = Task.create(task_params)
    task_list.tasks << task
    redirect_to task_list_path(task_list)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
