class TodoItem < ApplicationRecord
  belongs_to :todo_list
  belongs_to :user

  def completed?
    !completed_at.blank?
  end

  validates :title, presence: true
end
