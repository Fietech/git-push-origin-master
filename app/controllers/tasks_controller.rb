class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    #create a new task based on the params!
    @task = Task.new(task_params)
    #save the task
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    # Find the rtask we want to update on the DB
    # Update and save the task
    @task.update(task_params)
    # Redirect the user to the show page
    redirect_to task_path(@task)
  end

  def destroy
    # Find the task
    # Destroy the task
    @task.destroy
    # Redirect the user
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
