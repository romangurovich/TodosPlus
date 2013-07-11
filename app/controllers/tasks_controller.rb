class TasksController < ApplicationController
  respond_to :json

  def index
    resond_with Task.all
  end

  def show
    respond_with Task.find(params[:id])
  end

  def create
    respond_with Task.create(task_params)
  end

  def update
    respond_with Task.update(params[:id], task_params)
  end

  def destroy
    respond_with Task.destroy(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
