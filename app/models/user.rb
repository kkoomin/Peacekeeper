class User < ApplicationRecord
    has_many :tasks
    has_many :comments
    # validation


    def claimed
    end

    def completed
    end

end
