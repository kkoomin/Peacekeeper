class User < ApplicationRecord
    has_many :tasks
    has_many :comments
    # validation

    has_secure_password

    def claimed
    end

    def completed
    end

end
