class ProjectActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :project

  validates :activity_date, presence: true
  validates :notes, length: {maximum: 500}
end
