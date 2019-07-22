class TodosController < ApplicationController
  def index
    @todos = ::Todo.all.limit(20)
    render :json => @todos
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
