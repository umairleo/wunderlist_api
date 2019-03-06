class ListsController < ApplicationController
  before_action :authenticate_user
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = current_user.lists.all.order(id: :desc)

    success_list_index
  end

  def show
    success_list_show
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      success_list_created
    else
      error_list_save
    end
  end

  def update
    if @list.update(list_params)
      success_list_show
    else
      error_list_save 
    end
  end

  def destroy
    @list.destroy
    success_list_destroyed
  end
  protected

  def success_list_index
    render status: :ok, template: 'lists/index.json.jbuilder'
  end

  def success_list_created
    render status: :created, template: 'lists/show.json.jbuilder'
  end

  def success_list_show
    render status: :ok, template: 'lists/show.json.jbuilder'
  end

  
  def error_list_save
    render status: :unprocessable_entity, json: { errors: @list.errors.full_messages } 
  end
  def success_list_destroyed
    render status: :no_content, json: {}
  end

  private
  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.permit(:name)
  end

  
end