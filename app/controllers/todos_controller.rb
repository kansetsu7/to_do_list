class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todos = Todo.all
    if @todo.save
      flash[:notice] = "Successfully add mission \"#{@todo.name}\""
      redirect_to todos_url
    else
      flash[:alert] = "gg.."
      render :action => :index
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)    
  end
end
