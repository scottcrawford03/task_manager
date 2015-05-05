class CompleteTaskController < ApplicationController
  def index
    @tasks = Task.where(status: "complete", task_list_id: params[:task_list])
    @task_list = TaskList.find(params[:task_list])
  end
  
  def update
    task = Task.find(params[:id])
    if task.status == 'incomplete'
      task.update(status: "complete")
    else
      task.update(status: "incomplete")
    end
    render json: task
  end
end

