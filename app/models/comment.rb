class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :description, presence: true 

  scope :order_by_create, -> { order(created_at: :desc) }
end
