class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :description, presence: true 
end
