class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
  validates :name, length: {minimum: 3, maximum: 100}
end
