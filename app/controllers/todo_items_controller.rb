class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]
    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        redirect_to @todo_list
    end

    def complete
      @todo_item.update_attribute(:completed_at, Time.now)
      redirect_to @todo_list, notice: "Todo_item completed"
    end

    def destroy
      @todo_item.destroy
      redirect_to @todo_list, alert: "Todo_item deleted"
    end

    private

    def todo_item_params
        params.require(:todo_item).permit(:title)
    end

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end
end
