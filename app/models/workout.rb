class Workout < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  validates :name, presence: true 
  validates :date_completed, presence: true 
  validates :duration, presence: true 
  validates :description, presence: true 
end
