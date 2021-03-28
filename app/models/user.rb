class User < ApplicationRecord
    has_many :workouts 
    has_many :comments
    has_many :commented_workouts, through: :comments, source: :workout
end
