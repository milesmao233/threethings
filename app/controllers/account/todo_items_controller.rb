class Account::TodoItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]
    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        @todo_item.user_id = current_user.id

        if @todo_item.save
        redirect_to account_todo_list_path(@todo_list)
      end
    end

    def complete
        @todo_item.update_attribute(:completed_at, Time.now)
        redirect_to account_todo_list_path(@todo_list)
    end

    def cancel
        @todo_item.update_attribute(:completed_at, nil)
        redirect_to account_todo_list_path(@todo_list)
    end

    def destroy
        @todo_item.destroy
        redirect_to account_todo_list_path(@todo_list), alert: 'Todo_item deleted'
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
