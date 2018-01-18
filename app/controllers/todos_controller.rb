class TodosController < ApplicationController
  
  before_action :set_todo, only: [:edit, :update, :show, :destroy] 
  
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
   
  end
  
  def edit
   
  end
  
  def update
   
    if @todo.update(todos_params)
      flash[:notice] ="Todo was successfully updated!"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end
  
  def index
    @todo = Todo.all
  end 
  
  def destroy
  
   @todo.destroy
   flash[:notice] ="Todo was deleted!"
   redirect_to todos_path
  end
  
  private
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todos_params
      #white listing: what we allow our application to receive
       params.require(:todo).permit(:name, :description)
    end
  
  
end