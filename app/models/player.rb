class Player < ActiveRecord::Base
    belongs_to :dice
    validates :name, presence: true
end