class User < ApplicationRecord
    has_many :workouts 
    has_many :comments
    has_many :commented_workouts, through: :comments, source: :workout

    validates :username, uniqueness: true, presence: true

    has_secure_password

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u| 
            u.username = auth[:info][:email]
            u.password = SecureRandom.hex(17)
        end 
    end 
end
