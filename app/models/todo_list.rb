class TodoList < ApplicationRecord
  has_many :todo_items
  has_many :reviews
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

end
