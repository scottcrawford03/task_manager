class ArchiveTaskListController < ApplicationController
  def index
    @task_lists = TaskList.where(archived: true)
  end

  def update
    task_list = TaskList.find(params[:id])
    task_list.update(archived: true)
    render json: task_list
  end

  def destroy
    task_list = TaskList.find(params[:id])
    task_list.tasks.delete_all
    TaskList.delete(task_list)
    render json: task_list 
  end
end
