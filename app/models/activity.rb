class Activity < ApplicationRecord
  has_one :activity_value
  belongs_to :project
end
