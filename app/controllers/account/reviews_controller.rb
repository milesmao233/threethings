class Account::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @review = @todo_list.reviews.create(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to account_todo_list_path(@todo_list)
    else
      redirect_to account_todo_list_path(@todo_list), alert: "你需要填入内容"
    end
  end


  def destroy
    @todo_list = TodoList.find(params[:todo_list_id])
    @review = @todo_list.reviews.find(params[:id])
    @review.destroy
      redirect_to account_todo_list_path(@todo_list), alert: 'review deleted'
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
