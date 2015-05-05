class TaskListController < ApplicationController
  def show
    @task_list = TaskList.find(params[:id])
  end

  def new
  end

  def create
    TaskList.create(task_list_params)
    redirect_to root_path
  end

  private

  def task_list_params
    params.require(:task_list).permit(:title)
  end
end
