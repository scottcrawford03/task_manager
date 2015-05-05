class CompleteTaskController < ApplicationController
  def update
    task = Task.find(params[:id])
    task.update(status: "complete")
    render json: task
  end
end

