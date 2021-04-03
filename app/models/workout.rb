class Workout < ApplicationRecord
  belongs_to :user #user who created the workout
  has_many :comments #comments on a the workout
  has_many :users, through: :comments #users who commented on the workout

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

  def display_date
    self.date_completed.strftime('%m-%d-%y')
  end 
  
end
