class User < ApplicationRecord
    has_many :tasks
    has_many :comments
    has_many :posts
    validates :email, uniqueness: true
    validates :email, presence: true
    validates_format_of :email, :with =>/\A[\w\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, on: :create, :message => "must be formatted correctly."
    validates :password, presence: true
    validates :nickname, uniqueness: true
    validates :nickname, presence: true

    has_secure_password

    def claimed
    end

    def completed
    end

end
