class Activity < ApplicationRecord
  belongs_to :activity_value
  belongs_to :project
end
