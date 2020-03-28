class Project < ApplicationRecord
  belongs_to :client
  belongs_to :payment_method
  belongs_to :status
  has_many :project_tasks
  has_many :tasks, through: :project_tasks
  has_many :project_activities
  has_many :activities, through: :project_activities
end
