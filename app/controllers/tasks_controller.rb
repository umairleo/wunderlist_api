class TasksController < ApplicationController
  before_action :authenticate_user
  before_action :set_list
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    @tasks = @list.tasks.order(status: :asc)
    success_task_index
  end

  def show
    success_task_save
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      success_task_created
    else
      error_task_save
    end
  end

  def update
    if @task.update(task_params)
      success_task_save
    else
      error_task_save
    end
  end

  def destroy
    @task.destroy
    success_task_destroyed
  end
  protected

  def success_task_index
    render status: :ok, template: 'tasks/index.json.jbuilder'
  end

  def success_task_save
    render status: :ok, template: 'tasks/show.json.jbuilder'
  end

  def success_task_created
    render status: :created, template: 'tasks/show.json.jbuilder'
  end
  def error_task_save
    render status: :unprocessable_entity, json: { errors: @task.errors.full_messages } 
  end

  def success_task_destroyed
    render status: :no_content, json: {}
  end
  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params.permit(:name, :status)
  end
end
