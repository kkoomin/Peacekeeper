class Task < ApplicationRecord
    has_many :comments
    belongs_to :user
     # validation
    def status_description
        self.status == true ? "Complete" : "Incomplete"
    end
end
