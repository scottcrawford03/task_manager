class ArchiveTaskListController < ApplicationController
  def update
    task_list = TaskList.find(params[:id])
    task_list.update(archived: true)
    render json: task_list
  end
end
