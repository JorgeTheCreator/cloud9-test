class TodosController < ApplicationController
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo =Todo.new(todos_params)
    if @todo.save
      flash[:notice] = "This Todo Was Successfully Added!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def show
    @todo = Todo.find(params[:id])
  end

  private
  
    def todos_params
      #white listing: what we allow our application to receive
       params.require(:todo).permit(:name, :description)
    end
  
  
end