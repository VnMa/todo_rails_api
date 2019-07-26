class TodosController < ApplicationController
  include ::MyErrors
  include ::Helpers
  prepend_before_action :authenticate_request_token!

  def index
    @todos = ::Todo.all.limit(20)
    render :json => {user: @current_user, data:  @todos}
  end

  def create
    @todo = ::Todo.create(todo_params)
    render :json => @todo
  end

  def update
    @todo = ::Todo.find(params[:id])
    unless @todo.nil?
      @todo.update(todo_params)
    end

    render :json => @todo
  end

  def destroy
    @todo = ::Todo.find(params[:id])
    unless @todo.nil?
      @todo.destroy
    end

    render :json => @todo
  end

  private 
  def todo_params
    params.permit(:title, :content)
  end
end
