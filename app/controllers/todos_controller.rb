class TodosController < ApplicationController
  before_action :set_todo, :only => [:destroy, :edit, :update, :complete]
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Successfully add mission \"#{@todo.name}\""
      redirect_to todos_url
    else
      @todos = Todo.all
      flash[:alert] = "gg.."
      render :index
    end
  end

  def destroy
    @todo.destroy

    redirect_to todos_url
  end

  def edit
  end

  def complete
    if @todo.completed
      @todo.update_attribute(:completed, false)
    else
      @todo.update_attribute(:completed, true)
    end
    redirect_to todos_url
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_url    
    else
      render :edit
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)    
  end

  def todo_completed
    params.require(:todo).permit(:completed)
  end
end
