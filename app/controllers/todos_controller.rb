class TodosController < ApplicationController
  # before_action :set_todo, only => [:destroy]
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
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_url
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)    
  end
end
