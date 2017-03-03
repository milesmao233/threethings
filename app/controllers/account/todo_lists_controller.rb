class Account::TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_list, only:[:show, :edit, :update, :destroy]

  def index
    @todo_lists = current_user.todo_lists.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @todo_items = @todo_list.todo_items
  end

  def create
    @todo_list = TodoList.create(todo_list_params)
    @todo_list.user = current_user

    if @todo_list.save
      redirect_to account_todo_list_path(@todo_list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to account_todo_list_path(@todo_list)
    else
      render :edit
    end
  end

  def destroy
    @todo_list.destroy
    redirect_to account_todo_lists_path
  end

  private
  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end
end
