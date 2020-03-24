class Task < ApplicationRecord
  has_many :project_tasks
  has_many :projects, through: :project_tasks
  has_one :task_category
end
