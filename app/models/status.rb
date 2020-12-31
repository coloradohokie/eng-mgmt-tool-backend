class Status < ApplicationRecord
    validates :value, presence: true
end
