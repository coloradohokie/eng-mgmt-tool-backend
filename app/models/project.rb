class Project < ApplicationRecord
  belongs_to :client
  belongs_to :payment_method_value
  belongs_to :status_value
  has_many :project_tasks
  has_many :tasks, through: :project_tasks
end
