class DeleteTaskController < ApplicationController
  def destroy
    task = Task.find(params[:id])
    Task.delete(task)
    render json: task
  end
end
