class User < ApplicationRecord
    has_many :workouts 
    has_many :comments
    has_many :commented_workouts, through: :comments, source: :workout

    validates :username, uniqueness: true, presence: true

    has_secure_password
end
