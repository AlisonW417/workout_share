class Workout < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  validates :name, presence: true 
  validates :date_completed, presence: true 
  validates :duration, presence: true 
  validates :description, presence: true 

  scope :order_by_date, -> { order(date_completed: :desc) }

  def cardio_or_strength
    if self.cardio == true && self.strength == false 
      "Cardio"
    elsif self.cardio == false && self.strength == true 
      "Strength"
    else 
      "Cardio and Strength"
    end 
  end 
  
end
