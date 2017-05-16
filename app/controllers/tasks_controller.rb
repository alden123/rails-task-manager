class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to task_path(task)
  end

  def edit
    # @task = Task.find(params[:id])
    set_task
  end

  def update
    # @task = Task.find(params[:id])
    set_task
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    set_task
    @task.destroy
  end

end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :done)
  end

  def set_task
    @task = Task.find(params["id"])
  end
