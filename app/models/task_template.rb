class TaskTemplate < ApplicationRecord
    validates :value, presence: true
end
