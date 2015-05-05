class CompleteTaskController < ApplicationController
  def index
    @tasks = Task.where(status: "complete", task_list_id: params[:task_list])
  end
  
  def update
    task = Task.find(params[:id])
    task.update(status: "complete")
    render json: task
  end
end

