class Task < ApplicationRecord
    has_many :comments
    belongs_to :user
     # validation
     
end
